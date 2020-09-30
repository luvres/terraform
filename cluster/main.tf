## Source the Cloud Init Config file
data "template_file" "cloud_init" {
  count    = var.vm_count_master
  template = file("${path.module}/files/cloud_init.cloud_config")
  vars = {
    pubkey   = var.ssh_key
    hostname = "vm-0${count.index + 1}"
#    fqdn     = "vm-${count.index}.${var.domain_name}"
  }
}

## Create a local copy of the file, to transfer to Proxmox
resource "local_file" "cloud_init_user_data_file" {
  count    = var.vm_count_master
  content  = data.template_file.cloud_init[count.index].rendered
  filename = "${path.module}/files/cloud_init_vm-0${count.index + 1}.cfg"
}

## Transfer the file to the Proxmox Host
resource "null_resource" "cloud_init_config_files" {
  count = var.vm_count_master
  connection {
    type     = "ssh"
    user     = "root"
    password = var.pm_password
    host     = var.pm_host
  }
  
  provisioner "file" {
    source      = local_file.cloud_init_user_data_file[count.index].filename
    destination = "/var/lib/vz/snippets/cloud_init_vm-0${count.index + 1}.yml"
  }
}


## Create the VM
resource "proxmox_vm_qemu" "proxmox_vm" {
  depends_on = [
    null_resource.cloud_init_config_files
  ]
  
  count          = var.vm_count_master
  name           = "vm-0${count.index + 1}-master"
  target_node    = "pve"
  vmid           = "${var.vm_id}${var.ip_start + count.index}"
  
  # Clone from debian-cloudinit template
  clone          = "debian-cloudinit"
  os_type        = "cloud-init"
  
  # Cloud Init Settings
  cicustom  = "user=local:snippets/cloud_init_vm-0${count.index + 1}.yml"
  ipconfig0 = "ip=${var.subnet}.${var.ip_start + count.index}/${var.subnet_mask},gw=${var.gateway}"
  
  cpu            = "kvm64"
  sockets        = 1
  cores          = 2
  vcpus          = 2
  numa           = true
  memory         = 2048
  agent          = 1
  
  # Set the boot disk paramters
  bootdisk       = "scsi0"
  scsihw         = "virtio-scsi-pci"
  
  disk {
    id           = 0
    size         = 6
    type         = "scsi"
    storage      = "local-lvm"
    storage_type = "lvm"
    iothread     = true
  }
  
  network {
    id           = 0
    model        = "virtio"
    bridge       = "vmbr0"
  }
  
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  
}


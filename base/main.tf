# Create the VM  
resource "proxmox_vm_qemu" "proxmox_vm" {
  count             = var.vm_count
  name              = "vm-0${count.index + 1}"
  target_node       = "pve"
  vmid           = "${var.vm_id}${var.ip_start + count.index}"
  
  clone             = "debian-cloudinit"
  
  os_type           = "cloud-init"
  cpu               = "kvm64"
  sockets           = 1
  cores             = 2
  vcpus             = 2
  numa              = true
  memory            = 2048
  agent             = 1
  
  # Set the boot disk paramters
  bootdisk          = "scsi0"
  scsihw            = "virtio-scsi-pci"
  
  disk {
    id              = 0
    size            = 6
    type            = "scsi"
    storage         = "local-lvm"
    storage_type    = "lvm"
    iothread        = true
  }
  
  network {
    id              = 0
    model           = "virtio"
    bridge          = "vmbr0"
  }
  
  lifecycle {
    ignore_changes  = [
      network,
    ]
  }
  
  # Cloud Init Settings
  ipconfig0 = "ip=${var.subnet}.${var.ip_start + count.index}/${var.subnet_mask},gw=${var.gateway}"
  
#  ciuser     = "luvres"
#  cipassword = "aamu02"
  
  sshkeys = var.ssh_key
  
#  ssh_private_key = var.private_key


  provisioner "file" {
    source      = "./files/startup.sh"
    destination = "/tmp/startup.sh"
    connection {
      type        = "ssh"
      user        = "debian"
      private_key = file("~/.ssh/id_rsa")
      host        = self.ssh_host
    }
  }
  
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/startup.sh",
      "/tmp/startup.sh"
    ]
    connection {
      type        = "ssh"
      user        = "debian"
#      private_key = "${self.ssh_private_key}"
      private_key = file("~/.ssh/id_rsa")
      host        = self.ssh_host
    }
  }

  
}


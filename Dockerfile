FROM hashicorp/terraform:light
MAINTAINER Leonardo Loures <luvres@hotmail.com>

RUN mkdir -p /root/.terraform.d/plugins/github.com/telmate/proxmox/1.0.0/linux_amd64 
	
COPY terraform-provider-proxmox terraform-provisioner-proxmox \
     /root/.terraform.d/plugins/github.com/telmate/proxmox/1.0.0/linux_amd64/
			

## Terraform Proxmox Provider Cloud Init (TPPCI)
-----

#### Alias to terraform
```
echo "\nalias t='\
docker run --rm \
-v \$PWD:/app -w /app \
-v \$HOME/.ssh/id_rsa:/root/.ssh/id_rsa \
-v \$HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
-ti izone/terraform:proxmox'" >>$HOME/.zshrc
```
```
source $HOME/.zshrc
```
```
t init
t plan
t destroy
```
```
# Apply
t apply \
-var 'subnet=169.8.192' \
-var 'ip_start=101' \
-var 'subnet_mask=26' \
-var 'gateway=169.8.192.126' \
-var 'vm_count_master=1' -var 'vm_count_worker=3'
```
-----
### Create a directory for the project, then add a provider.tf:
```
terraform {
  required_providers {
    proxmox = {
      versions = "1.0.0"
      source = "github.com/telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_url = var.pm_api_url
  pm_user = var.pm_user
  pm_password = var.pm_password
  pm_tls_insecure = var.pm_tls_insecure
}

```
### Separate file for variables as good practice in variables.tf:
```
variable "pm_api_url" {
  default = "https://proxmox_host:8006/api2/json"
}

variable "pm_user" {
  default = "root@pam"
}

variable "pm_password" {
  default = "pass1234"
}

variable "pm_tls_insecure" {
  default = "true"
}

```
#### running directly
```
docker run --rm --name Terraform \
-v $PWD:/app -w /app \
-ti izone/terraform:proxmox init
```
```
docker run --rm --name Terraform \
-v $PWD:/app -w /app \
-ti izone/terraform:proxmox plan
```
```
docker run --rm --name Terraform \
-v $PWD:/app -w /app \
-ti izone/terraform:proxmox apply
```
```
docker run --rm --name Terraform \
-v $PWD:/app -w /app \
-ti izone/terraform:proxmox destroy
```
#### Running setting up directory
```
docker run --rm --name Terraform \
-v $PWD:/app \
-w /app \
--entrypoint "" \
-ti izone/terraform:proxmox sh
```

-----

#### Build
```
docker build -t izone/terraform .
```
```
docker build -t izone/terraform:proxmox .
```

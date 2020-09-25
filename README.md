## Terraform Proxmox Provider Cloud Init (TPPCI)
-----

#### Pull image
```
docker pull izone/terraform:proxmox
```
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
  pm_api_url = "https://191.96.255.97:8006/api2/json"
  pm_user = "root@pam"
  pm_password = "$PM_PASS"
  pm_tls_insecure = "true"
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

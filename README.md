## Terraform Proxmox Provider (TPP)
-----

#### Pull image
```
docker pull izone/terraform:proxmox
```
#### Running setting up directory
```
docker run --rm --name Terraform \
-v $PWD:/app \
-w /app \
--entrypoint "" \
-ti izone/terraform:proxmox sh
```
#### running directly
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

-----

#### Build
```
docker build -t izone/terraform .
```
```
docker build -t izone/terraform:proxmox .
```

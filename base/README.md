## Init
docker run --rm \
-v $PWD:/app -w /app \
-v $HOME/.ssh/id_rsa:/root/.ssh/id_rsa \
-v $HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
-ti izone/terraform:proxmox init

## Plan
docker run --rm \
-v $PWD:/app -w /app \
-v $HOME/.ssh/id_rsa:/root/.ssh/id_rsa \
-v $HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
-ti izone/terraform:proxmox plan


## Apply
docker run --rm \
-v $PWD:/app -w /app \
-v $HOME/.ssh/id_rsa:/root/.ssh/id_rsa \
-v $HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
-ti izone/terraform:proxmox apply

docker run --rm \
-v $PWD:/app -w /app \
-v $HOME/.ssh/id_rsa:/root/.ssh/id_rsa \
-v $HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
-ti izone/terraform:proxmox apply -var 'vm_count=1'


## Destroy
docker run --rm \
-v $PWD:/app -w /app \
-v $HOME/.ssh/id_rsa:/root/.ssh/id_rsa \
-v $HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
-ti izone/terraform:proxmox destroy



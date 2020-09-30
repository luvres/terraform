## Alias to terraform
echo "\nalias t='\
docker run --rm \
-v \$PWD:/app -w /app \
-v \$HOME/.ssh/id_rsa:/root/.ssh/id_rsa \
-v \$HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
-ti izone/terraform:proxmox'" >>$HOME/.zshrc

source $HOME/.zshrc


# Init first
t init

# Plan
t plan

# Destroy
t destroy

# Apply
t apply \
-var 'subnet=169.8.192' \
-var 'ip_start=101' \
-var 'subnet_mask=26' \
-var 'gateway=169.8.192.126' \
-var 'vm_count_master=1' -var 'vm_count_worker=3'

# -----------
# -----------

# Init
docker run --rm \
-v $PWD:/app -w /app \
-v $HOME/.ssh/id_rsa:/root/.ssh/id_rsa \
-v $HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
-ti izone/terraform:proxmox init

# Plan
docker run --rm \
-v $PWD:/app -w /app \
-v $HOME/.ssh/id_rsa:/root/.ssh/id_rsa \
-v $HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
-ti izone/terraform:proxmox plan


# Apply
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


# Destroy
docker run --rm \
-v $PWD:/app -w /app \
-v $HOME/.ssh/id_rsa:/root/.ssh/id_rsa \
-v $HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
-ti izone/terraform:proxmox destroy



#!/bin/bash

# Instalar pacotes necessários
apt install git curl build-essential sudo -y

# Bloqueia o driver nouveau
cat <<EOF > /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0
EOF

# Atualizar initramfs
sudo update-initramfs -u

# Remover o módulo nouveau
sudo rmmod nouveau

# Atualizar configuração do GRUB
sudo update-grub

# Stop the display manager (assuming lightdm, adjust if necessary)
sudo service lightdm stop

# Baixar CUDA e dar permissão 
wget -c https://developer.download.nvidia.com/compute/cuda/12.3.2/local_installers/cuda_12.3.2_545.23.08_linux.run
chmod 755 cuda_12.3.2_545.23.08_linux.run

# Instalar cabeçalhos do kernel
apt install linux-headers-$(uname -r) -y

# Executar o instalador do CUDA
echo "Instalando Driver Cuda 12.3.2_545.23.08 aguarde um momento"
sh ./cuda_12.3.2_545.23.08_linux.run --override --driver --toolkit --silent

echo "Instalação concluída com sucesso."
echo "Reinicie o Servidor/Computador."

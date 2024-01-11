#!/bin/bash

# Atualizar o sistema
apt update && apt upgrade -y

# Instalar pacotes necessários
apt install git curl build-essential wget -y

# Adicionar configurações ao arquivo de blacklist
bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"

# Remover módulo nouveau
rmmod nouveau

# Atualizar initramfs
update-initramfs -u

# Baixar e instalar CUDA
wget -c https://developer.download.nvidia.com/compute/cuda/12.3.2/local_installers/cuda_12.3.2_545.23.08_linux.run
chmod +x cuda_12.3.2_545.23.08_linux.run
./cuda_12.3.2_545.23.08_linux.run --override --driver --toolkit --silent

echo "Instalação concluída com sucesso."

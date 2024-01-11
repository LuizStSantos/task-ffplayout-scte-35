#!/bin/bash

# Verifica se o script está sendo executado como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script deve ser executado como root. Por favor, use sudo ou mude para o usuário root."
    exit 1
fi

# Instalar pacotes necessários
apt install git curl build-essential wget sudo -y

# Bloqueia o driver nouveau
echo "blacklist nouveau" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
echo "options nouveau modeset=0" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf

# Atualizar initramfs
update-initramfs -u

# Baixar e instalar CUDA
wget -c https://developer.download.nvidia.com/compute/cuda/12.3.2/local_installers/cuda_12.3.2_545.23.08_linux.run
chmod 755 cuda_12.3.2_545.23.08_linux.run
./cuda_12.3.2_545.23.08_linux.run --override --driver --toolkit --silent

echo "Instalação concluída com sucesso."

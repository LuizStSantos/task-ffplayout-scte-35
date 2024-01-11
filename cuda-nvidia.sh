#!/bin/bash

# Instalar pacotes necessários
apt install git curl build-essential wget sudo -y


# Bloqueia o driver nouveau
cat <<EOF > /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0
EOF

# Atualizar initramfs
update-initramfs -u

# Baixar e instalar CUDA
wget -c https://developer.download.nvidia.com/compute/cuda/12.3.2/local_installers/cuda_12.3.2_545.23.08_linux.run
chmod +x cuda_12.3.2_545.23.08_linux.run
./cuda_12.3.2_545.23.08_linux.run --override --driver --toolkit --silent

echo "Instalação concluída com sucesso."

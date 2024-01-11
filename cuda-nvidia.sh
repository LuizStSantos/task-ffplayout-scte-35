#!/bin/bash
# Instalação dos pacotes necessários
apt update
apt install -y git curl build-essential wget sudo
# Bloqueia o driver nouveau
cat <<EOF > /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0
EOF
# Atualiza o initramfs
update-initramfs -u
# Download e instalação do NVIDIA CUDA 12.3.2
wget -c -P /tmp/ https://developer.download.nvidia.com/compute/cuda/12.3.2/local_installers/cuda_12.3.2_545.23.08_linux.run
chmod +x /tmp/cuda_12.3.2_545.23.08_linux.run
/tmp/cuda_12.3.2_545.23.08_linux.run --override --driver --toolkit --silent
echo "Instalação concluída com sucesso."

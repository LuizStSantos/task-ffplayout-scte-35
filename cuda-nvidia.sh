#!/bin/bash
apt install git curl build-essential wget -y
bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
rmmod nouveau
update-grub
update-initramfs -u
wget -c -P /tmp/ https://developer.download.nvidia.com/compute/cuda/12.3.2/local_installers/cuda_12.3.2_545.23.08_linux.run
chmod +x /tmp/cuda_12.3.2_545.23.08_linux.run
/tmp/cuda_12.3.2_545.23.08_linux.run --override --driver --toolkit --silent
echo "Instalação concluída com sucesso."

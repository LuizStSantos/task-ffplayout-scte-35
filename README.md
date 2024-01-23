# Guia scritps
# Pacote necessário
```shell
apt install wget
```
ou
```shell
sudo apt install wget
```
# Script Cuda Nvidia "Testado Debian 12"
Esse script instala o git, curl, build-essential e sudo
bloqueia o driver nouveau e atualiza o initramfs
remove o modulo nouveau e atualiza configuração do GRUB
e para o serviço lightdm faz o download do cuda nvidia; 
da a apermissão 755 para ele installa o linux-headers,
executa a instalação do cuda nvidia.
```shell
wget -O - https://raw.githubusercontent.com/LuizStSantos/scripts/main/cuda-nvidia.sh | bash
```
ou
```shell
sudo wget -O - https://raw.githubusercontent.com/LuizStSantos/scripts/main/cuda-nvidia.sh | sudo bash
```
# Script ffmpeg - python3 - pip3 - x9k3
Esse script instala o FFmpeg, Python 3 e pip
remove o diretório rm -rf /usr/lib/python3.*/EXTERNALLY-MANAGED
e instala a biblioteca x9k3 para hls SCTE-35.
```shell
wget -O - https://raw.githubusercontent.com/LuizStSantos/scripts/main/ffmpeg-python3-pip-x9k3.sh | bash
```
ou
```shell
sudo wget -O - https://raw.githubusercontent.com/LuizStSantos/scripts/main/ffmpeg-python3-pip-x9k3.sh | sudo bash
```
# Script ffmpeg - pypy3 - python3 - pip - umzz
Esse script instala o FFmpeg, Pypy3, Python 3 e pip
remove os diretórios rm -rf /usr/lib/python3.*/EXTERNALLY-MANAGED e rm -rf /usr/lib/pypy3.*/EXTERNALLY-MANAGED
e instala a biblioteca umzz para hls SCTE-35.
```shell
wget -O - https://raw.githubusercontent.com/LuizStSantos/scripts-cuda-ffmpeg-x9k3/main/ffmpeg-pypy3-python3-pip-umzz.sh  | bash
```
ou

```shell
sudo wget -O - https://raw.githubusercontent.com/LuizStSantos/scripts-cuda-ffmpeg-x9k3/main/ffmpeg-pypy3-python3-pip-umzz.sh | sudo bash
```

#!/bin/bash

# Atualizar o sistema
apt update

# Instalar o FFmpeg
apt install -y ffmpeg

# Instalar Python 3 e pip
apt install -y python3 python3-pip

# Remover o diretório /usr/lib/python3.*/EXTERNALLY-MANAGED
rm -rf /usr/lib/python3.*/EXTERNALLY-MANAGED

# Instalar a biblioteca x9k3 usando pip
python3 -mpip install x9k3

echo "Instalação do FFmpeg, Python 3, pip e x9k3 concluída com sucesso."
echo "O diretório /usr/lib/python3.*/EXTERNALLY-MANAGED foi removido."


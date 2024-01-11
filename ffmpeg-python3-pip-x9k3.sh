#!/bin/bash
apt update
apt install ffmpeg
apt install -y python3 python3-pip
rm -rf /usr/lib/python3.*/EXTERNALLY-MANAGED
python3 -mpip install x9k3
echo "Instalação do FFmpeg, Python 3, pip e x9k3 concluída com sucesso."
echo "O diretório /usr/lib/python3.*/EXTERNALLY-MANAGED foi removido."

#!/bin/bash

# Verifica se o script está sendo executado como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script deve ser executado como root. Por favor, use sudo ou mude para o usuário root."
    exit 1
fi

# Atualiza a lista de pacotes
apt update

# Instala o FFmpeg
apt install -y ffmpeg

# Instala o Python 3 e pip para Python 3
apt install -y python3 python3-pip

# Remove o diretório /usr/lib/python3.*/EXTERNALLY-MANAGED
rm -rf /usr/lib/python3.*/EXTERNALLY-MANAGED

# Instala o pacote Python x9k3
python3 -mpip install x9k3

echo "Instalação do FFmpeg, Python 3, pip e x9k3 concluída com sucesso."
echo "O diretório /usr/lib/python3.*/EXTERNALLY-MANAGED foi removido."
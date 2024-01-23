#!/bin/bash

# Atualizar lista de pacotes
sudo apt update

# Instalar pypy3, python 3 e pip
sudo apt -y install pypy3 python3 python3-pip

# Garantir que o pip esteja instalado para o pypy3
sudo /usr/bin/pypy3 -m ensurepip

# Remover diretórios EXTERNALLY-MANAGED para python3
sudo rm -rf /usr/lib/python3.*/EXTERNALLY-MANAGED

# Remover diretórios EXTERNALLY-MANAGED para pypy3
sudo rm -rf /usr/lib/pypy3.*/EXTERNALLY-MANAGED

# Instalar o pacote 'umzz' usando o pip do pypy3
sudo pypy3 -mpip install umzz

echo "Script concluído com sucesso!"

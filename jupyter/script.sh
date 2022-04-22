#!/bin/bash

echo "Actualizar sistema"
sudo apt-get update
echo "Crear directorio"
mkdir jupyter
cd jupyter
sudo apt install python3-pip
sudo pip install 'prompt-toolkit==1.0.15'
echo "Instalar jupyter"
pip3 install jupyter
jupyter notebook --generate-config
sed -i 's/#c.NotebookApp.allow_remote_access = False/c.NotebookApp.allow_remote_access = True/g' ~/.jupyter/jupyter_notebook_config.py
export PATH="$HOME/.local/bin:$PATH"
echo "Ejecutar jupyter"
jupyter notebook --ip=0.0.0.0 --allow-root
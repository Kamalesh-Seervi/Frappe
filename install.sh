#!/bin/bash

set -e

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y git python3-dev python3-setuptools python3-pip virtualenv \
    python3.11-venv software-properties-common mariadb-server expect \
    libmysqlclient-dev redis-server curl xvfb libfontconfig wkhtmltopdf

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.nvm/nvm.sh
nvm install --lts
nvm use --lts


sudo npm install -g yarn


cd ~
git clone https://github.com/vineyrawat/Tekton-Theme.git
cd oracle-oci/frappe-bench
sudo chown -R $USER:$USER .


python3.10 -m venv env
source env/bin/activate

pip install --upgrade pip
pip install -r requirements.txt
pip install frappe-bench

bench init frappe-bench
cd frappe-bench
bench new-site mysite
bench use mysite
bench start
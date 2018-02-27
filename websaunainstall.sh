#!/bin/bash

apt-get -y update
apt-get -y install git build-essential libfreetype6-dev libncurses5-dev libxml2-dev libxslt1-dev libjpeg-dev libpng12-dev libffi-dev gettext python-virtualenv python-software-properties redis-server postgresql postgresql-contrib fail2ban libpq-dev python-pip python3-venv python3-software-properties python3-dev

ufw default allow outgoing
ufw default deny incoming
ufw allow ssh/tcp
ufw limit ssh/tcp
ufw allow http/tcp
ufw allow https/tcp
ufw --force enable



mkdir work && cd work
python3.5 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install wheel
pip install "websauna[celery,utils,notebook]"
pip install cookiecutter

mkdir myproject && cd myproject
source venv/bin/activate

# TODO EDIT  cookiecutter.json file for --no-input command
# /root/.cookiecutters/cookiecutter-websauna-app/cookiecutter.json

cookiecutter gh:websauna/cookiecutter-websauna-app --no-input

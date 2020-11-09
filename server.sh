#!/bin/bash

#wget https://raw.githubusercontent.com/ouseful-demos/ou-rclub/master/server.sh
#chmod u+x server.sh 
#./server.sh

# install Docker
sudo apt update && sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update && sudo apt install -y docker-ce

# pull the repo2docker image
sudo docker pull jupyter/repo2docker:master

# install TLJH
curl https://raw.githubusercontent.com/jupyterhub/the-littlest-jupyterhub/master/bootstrap/bootstrap.py \
  | sudo python3 - \
    --admin test:test \
    --plugin git+https://github.com/plasmabio/tljh-repo2docker@master
    
sudo tljh-config set auth.type firstuseauthenticator.FirstUseAuthenticator
sudo tljh-config set auth.FirstUseAuthenticator.create_users True

IMGDIR=/usr/local/share/jupyter/hub/static/images
mkdir -p $IMGDIR
wget https://github.com/ouseful-demos/ou-rclub/raw/master/.jupyter/custom/OU-logo-83x65.png -P $IMGDIR

sed -i 's/^#?\s+c.JupyterHub.logo_file.*/c.JupyterHub.logo_file = "/usr/local/share/jupyter/hub/static/images/OU-logo-83x65.png"/' /opt/tljh/hub/lib/python3.6/site-packages/tljh/jupyterhub_config.py

sudo tljh-config reload

#!/bin/bash

echo "Step 1: Updating system packages..."
sudo dnf update -y && sudo dnf upgrade -y

echo "Step 2: Installing DNF plugins core..."
sudo dnf -y install dnf-plugins-core
echo "Step 3: Adding Docker repository..."
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

echo "Step 4: Installing Docker and related packages..."
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Step 5: Starting and enabling Docker service..."
sudo systemctl enable --now docker

echo "Step 6: Testing Docker installation with hello-world..."
sudo docker run hello-world

echo "Step 7: Setting up Docker user permissions..."
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

echo "Step 8: Installing Docker Compose plugin..."
sudo apt-get install -y docker-compose-plugin
sudo yum install -y docker-compose-plugin
echo "Step 9: Verifying Docker Compose installation..."
docker compose version

echo "Docker installation and setup completed!"

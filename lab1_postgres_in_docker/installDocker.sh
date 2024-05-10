#!/bin/bash

# Install Docker
curl -fsSL https://test.docker.com -o test-docker.sh
sudo sh test-docker.sh

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Add user to the docker group
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Clean up
rm test-docker.sh

echo "Docker and Docker Compose installation completed."

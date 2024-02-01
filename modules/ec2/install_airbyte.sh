#!/bin/sh

# Update the system
sudo yum update -y

# Install Docker
sudo yum install -y docker
sudo service docker start

# Install docker-compose
sudo mkdir -p /usr/local/lib/docker/cli-plugins/
sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# Create Airbyte directory and navigate into it
mkdir airbyte && cd airbyte

# Download Airbyte installation script
sudo wget https://raw.githubusercontent.com/airbytehq/airbyte/master/run-ab-platform.sh

# Make the script executable
sudo chmod +x run-ab-platform.sh

# Run the Airbyte installation script
sudo ./run-ab-platform.sh -b

# Set Environment Variables for Credentials to access the Airbyte UI
username='<your_username_here>'
sed -i "s/^BASIC_AUTH_USERNAME=airbyte/BASIC_AUTH_USERNAME=${username}/" .env

password='<your_password_here>'
sed -i "s/^BASIC_AUTH_PASSWORD=password/BASIC_AUTH_PASSWORD=${password}/" .env

cat >> .env <<'EOF'
TEMPORAL_HISTORY_RETENTION_IN_DAYS=7
EOF

# Stop docker 
sudo docker compose down

# Start docker to pick up new environment variables
sudo docker compose up


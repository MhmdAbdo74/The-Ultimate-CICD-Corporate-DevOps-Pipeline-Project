#!/bin/bash

# Update package index
sudo apt-get update

# Install necessary dependencies
sudo apt-get install -y curl gnupg2 software-properties-common

# Add Prometheus repository
curl -sSL https://packagecloud.io/gpg.key | sudo apt-key add -
echo "deb https://packagecloud.io/prometheus/apt/ubuntu/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/prometheus.list

# Add Grafana repository
curl -sSL https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

# Update package index again
sudo apt-get update

# Install Prometheus
sudo apt-get install -y prometheus

# Install Grafana
sudo apt-get install -y grafana

# Start Prometheus
sudo systemctl start prometheus

# Start Grafana
sudo systemctl start grafana-server

# Enable Prometheus and Grafana to start on boot
sudo systemctl enable prometheus
sudo systemctl enable grafana-server

# Print out information about accessing Grafana
echo "Grafana is now installed and running."
echo "You can access it at http://localhost:3000"
echo "Login with the default username 'admin' and password 'admin'."

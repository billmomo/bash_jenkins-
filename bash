#!/bin/bash

# Update the system
sudo yum update -y

# Install wget
sudo yum install wget -y

# Add Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import Jenkins key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Upgrade packages
sudo yum upgrade -y

# Install Docker and enable service
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker.service

# Allow Jenkins to communicate with Docker
sudo chmod 777 /var/run/docker.sock

# Install Git and unzip
sudo yum install git -y
sudo yum install unzip -y

# Install Java 11
sudo yum install java-11* -y

# Install Jenkins and enable service
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Display initial Jenkins admin password
echo "Initial Jenkins Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
# Display instruction for accessing Jenkins
echo "Access Jenkins by navigating to http://your_server_ip:8080"

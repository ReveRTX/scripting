#! /bin/bash

echo "Update and upgrade packages";
sudo yum update && sudo yum upgrade -y;

echo "Installing jenkins, please wait..";
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/rpm-stable/jenkins.repo;
sudo rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2026.key;
sudo yum upgrade;
sudo yum install java-21-amazon-corretto -y;
sudo yum install jenkins -y;

echo "Almost done... Please wait...";
sudo systemctl enable jenkins;
sudo systemctl start jenkins;

echo "Find the password on jenkinspass.txt";
sudo cat /var/lib/jenkins/secrets/initialAdminPassword >> /home/ec2-user/jenkinspass.txt;

echo "Jenkins installed successfully";
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

echo "Installing Terraform, please wait..";
sudo yum install -y yum-utils shadow-utils;
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo;
sudo yum install terraform;

echo "Terraform installed successfully";

echo "Installing ansible, please wait..";
sudo yum install ansible -y;

echo "Ansible installed successfully";

echo "Update and upgrade packages one last time..";
sudo yum update && sudo yum upgrade -y;

echo "Installation finished: All tasks successful"
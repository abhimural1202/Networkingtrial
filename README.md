Automated Dockerized Web Application Deployment

This project demonstrates the automation of a Dockerized web application deployment using modern DevOps tools. The workflow includes provisioning cloud infrastructure, configuring servers, containerizing the application, and implementing a CI/CD pipeline using Terraform, Docker, Ansible, and GitHub Actions.

Prerequisites

Install Terraform

Install Docker Desktop through WSL (Windows Subsystem for Linux)

Install Ansible on WSL and the Azure VM

Create a GitHub Repository

Set up Azure Virtual Machine (VM)

Project Workflow

1. Setup Terraform for Infrastructure Provisioning

Install terraform.exe.

Create a project folder and open it in VS Code.

Inside the folder, create Terraform configuration files:

main.tf

variable.tf

provider.tf

terraform.tfvars

Run the following Terraform commands:

terraform init  # Initialize Terraform
terraform plan  # Preview the execution plan
terraform apply # Apply the changes and create the resources

2. Automate Docker Installation with Ansible

Create an inventory file hosts.ini with VM host details and SSH key location:

[myservers]
vm-ubuntu ansible_host=20.121.65.148 ansible_user=azureuser ansible_ssh_private_key_file=~/.ssh/vm-ubuntu_key.pem

Create an Ansible playbook docker-setup.yml to install Docker.

Run the Ansible playbook using the following command in WSL:

ansible-playbook -i hosts.ini docker-setup.yml -vvv

If Ansible is not installed on the Azure VM, install it with:

sudo apt update
sudo apt install -y ansible

Verify the installations:

ansible --version
docker --version

Set up SSH key permissions correctly:

mkdir -p ~/.ssh
ls -ld ~/.ssh  # Verify that the folder is created
sudo chown $(whoami):$(whoami) ~/.ssh/vm-ubuntu_key.pem  # Change ownership
ls -l ~/.ssh/vm-ubuntu_key.pem  # Confirm ownership
sudo chmod 600 ~/.ssh/vm-ubuntu_key.pem  # Set correct permissions
ls -l ~/.ssh/vm-ubuntu_key.pem  # Confirm it

3. Create and Deploy the Dockerized Web Application

Create a Dockerfile and an index.html file for the web application.

Copy these files to the Azure VM using scp:

scp Dockerfile index.html <azure-vm-username>@<vm-ip>:/home/<username>/

4. Push Code to GitHub Repository

Initialize a Git repository:

git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin <your-github-repository-url>
git push -u origin main

5. Implement CI/CD Pipeline

Create a GitHub Actions workflow named Docker CI/CD Pipeline:


6. Automated Deployment with CI/CD

Whenever changes are made to index.html and pushed to GitHub:

The CI/CD pipeline is triggered.

The Docker container is rebuilt and deployed.

Changes are automatically reflected in the web application running on the VM.

Conclusion

This project automates the deployment of a web application using Infrastructure as Code (Terraform), Configuration Management (Ansible), Containerization (Docker), and Continuous Deployment (GitHub Actions). The setup ensures a seamless workflow for updating and managing the application efficiently.




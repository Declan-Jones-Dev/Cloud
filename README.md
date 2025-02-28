# Azure Automation Repository and az CLI equivalent

This repo contains automation scripts and templates for deploying and managing Azure resources and services, as well as the equivalent commands in the az CLI. 

Note: The use of the AZ CLI has been done on a windows native OS using Ubuntu multipass shell from ps1 for the favored simplicity of connecting to a VM using SSH instead of RDP, but all these commands can be run from Windows Powershell and the VM connected to via RDP.

## Features
- **Bash Script**: Automates VM deployment using the azure CLI.
-**Terraform (.tf) script**: Deploys a VM and associated resources using Infrastructure.
-**Bicep Template**: Configures Azure Monitor for the deployed resource.

## Prereqs
-Azure CLI installed and authenticated, (`az login`)
-Terraform installed (for main.tf and future terraform init and apply automation commands)
-Azure Bicep CLI installed for `azure_monitor.bicep`.

## Usage 

### 1. Install multipass if applicable, az CLI, and login from either bash or powershell with 'az login'.

### 2. Deploy a VM using the bash script
chmod +x deploy_vm.sh &&
./deploy_vm.sh

### 3. Deploy resources using terraform
terraform init &&
terraform apply

### 4. Configure Azure Monitor using Bicep
az deployment group create -g <ResourceGroupName> --template-file azure_monitor.bicep --parameters @azure_monitor.parameters.json

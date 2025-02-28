# This Bash script automates the deployment of a Linux VM in Azure using the Azure CLI.

# Variables
RESOURCE_GROUP="MyResourceGroup"
LOCATION="eastus"
VM_NAME="MyLinuxVM"
ADMIN_USER="azureuser"

# Create Resource Group
echo "Creating resource group..."
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create VM
echo "Creating VM..."
az vm create -g $RESOURCE_GROUP -n $VM_NAME --image Windows2022Datacenter --admin-username $ADMIN_USER --generate-ssh-keys

# Open Port 22 for SSH
echo "Opening port 22 for ssh..."
az vm open-port --port 22 -g $RESOURCE_GROUP -n $VM_NAME

# Create a condition to check if the VM and resource group are succesfully created, and if so return a success log/alert, and if not return a log of the failure
if az vm show -g $RESOURCE_GROUP -n $VM_NAME --query provisioningState -o tsv | grep -q 'Succeeded'; then
echo "VM and resource group created successfully."
else
echo "Failed to create VM and resource group."
fi
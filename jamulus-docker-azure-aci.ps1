# This script will create a Jamulus docker container from grundic/jamulus as an
# Azure Container Instance.  The docker container readme has a list of all
# of the possible parameters, simply adjust the command-line parameter here
# with whatever values you need. (https://github.com/grundic/jamulus-docker)
# Running this script requires Powershell (installed by default on Windows 10) and either
# Azure CLI (https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) or 
# the Cloud Shell (https://azure.microsoft.com/en-us/features/cloud-shell/)

$resourcegroupname = 'some-resourcegroup-name'
$servername = 'my-jamulus-servername'
$azureserverlocation = 'eastus' 
az container create --resource-group $resourcegroupname `
--name $servername `
--image grundic/jamulus <# Use the following image: https://github.com/grundic/jamulus-docker #>`
--command-line "/usr/local/bin/Jamulus -e TZ=America/Chicago -d -n -s -p 22124 -l /jam/jamulus.log -w 'Welcome to the $servername jam server.' -T" `
--ports 22124 <# Expose the Jamulus UDP port defined in command-line to the internet #>`
--protocol UDP `
--ip-address Public <# Assign a public IP address to this instance #>`
--dns-name-label $servername <# Assign the FQDN of <servername>.<azureserverlocation>.azurecontainer.io #>`
--location $azureserverlocation <# get a list of Azure locations by running "az account list-locations -o table" #>`
--cpu 2 <# Number of CPU vCores #>`
--memory 1.5 <# RAM in GB #>
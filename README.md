## Jamulus Azure ACI Automation

This script is all you need to install Jamulus on an Azure Container Instance.  Azure ACI is a serverless runtime for Docker containers.

All credit for the Jamulus docker image should be directed here: https://github.com/grundic/jamulus-docker

# Instructions

Download the file, and customize the resourcegroupname, servername, and azureserverlocation variables.  Then run jamulus-docker-azure-aci via Powershell (the commands could also be run via the Azure Cloud Shell):

First, log in to azure:

        az login
        
Then, download this Powershell script and execute it from any folder:

        ./jamulus-docker-azure-aci.ps1
        
If you used a servername of "myjamulusserver" in "eastus", your server name would now be "my-jamulus-server.eastus.azurecontainer.io".

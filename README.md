**Using Docker to run WordPress on an Azure VM**

# Part 1 - Azure MV

![Azure VM](./images/Screenshot%202024-10-20%20172554.png)

Goto portal.azure.com
- Create account
- Log in

Create Subscription
- free credits for one year

Create a VM
- Name
- Region
    - Australia East
- Image
    - Ubuntu 22.04 LTS
- Username
    - default: "azureuser"
- Create SSH private/public key
    - store private locally
    - store public key inside the VM
- Inbound ports
    - for SSH: 22
    - for HTTP: 80

SSH connection using Putty
- SSH key format conversion
    - using PuttyGen
    - Putty > Conversions
    - convert PEM to PPK
- Connect to the VM
    - get the public IP from the Azure VM page
    - Host name: azureuser@ip address
- Run command for Ubuntu update
    ``` sh
    sudo apt update && sudo apt upgrade -y
    ```

# Part 2 - Docker
⚠️ Everything below should be done inside the VM

Connect to the public GitHub repository 
- https://github.com/tommy-yoon/azure-vm-docker-wordpress
- clone all the files
    ```
    sudo git clone https://github.com/tommy-yoon/azure-vm-docker-wordpress.git

    cd azure-vm-docker-wordpress
    ```

Install Docker engine

Create Dockerfile 
- actually docker-compose for multiple docker containers
- YAML format
- Use docker-compose.yml

Build Docker containers
``` sh
docker run
```
Access WordPress web page
- Initialisation page

Restore backup data
- Use the preapred MySQL DB file to skip the WordPress initialisation

Use Wordpress to post articles

Backup MySQL data
- It can be used to restore the whole site
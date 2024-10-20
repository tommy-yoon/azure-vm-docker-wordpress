**Using Docker to run WordPress on an Azure VM**

# Part 1 - Azure MV

![Azure VM](./azure.png)

Goto portal.azure.com
- Create a Microsoft account - probably personal account
- Log in into the account

Create Subscription
- free credits for one year for practice

Create a VM
- Name - any name
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

Install Docker engine & docker-compose
1. Remove existing Docker packages. 
    ``` sh
    sudo apt-get remove docker docker-engine docker.io containerd runc 
    ```
2. Update the apt package index. 
    ``` ah
    sudo apt-get update 
    sudo apt-get install ca-certificates curl gnupg 
    ```
3. Add the Docker GPG kye. 
    ``` sh
    sudo install -m 0755 -d /etc/apt/keyrings 
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg 
    sudo chmod a+r /etc/apt/keyrings/docker.gpg 
    ```
4. Set-up the repository. 
    ``` sh
    echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 
    ```
5. Install Docker from the official repo. 
    ``` sh
    sudo apt-get update  
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 
    ```
6. Install docker-compose 
    ``` sh
    sudo apt install docker-compose 
    ```
7. Verify its installation
    ``` sh
    docker --version
    docker-compose --version
    ```

Create Dockerfile 
- actually docker-compose for multiple docker containers
- YAML format
- Use docker-compose.yml

Build Docker containers
``` sh
sudo docker-compose up -d 
```

Access WordPress web page
- http://IP address of VM/
- It will show the initialisation page of WordPress

Restore backup data
- Use the preapred MySQL DB file to skip the WordPress initialisation
    ``` sh
    ./restore_db.sh 
    ```

Use Wordpress to post articles

Backup MySQL data
- It can be used to restore the whole site
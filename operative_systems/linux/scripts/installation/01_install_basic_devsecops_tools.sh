#!/bin/bash

echo '########################################'
echo 'Install Development componentes for WSL2'
echo 'This setup is to install and environment for DevSecOps'
echo '########################################'
echo
echo
echo 'WARNING: This script works on  Ubuntu 22.04'
echo 'press Enter to continue'
read


echo '########################################'
echo 'Initial updating and upgrating our system'
echo '########################################'
echo

sudo apt-get update -y  && sudo apt-get upgrade -y 


echo '########################################'
echo 'Installing initial libraries'
echo '########################################'
echo

sudo apt-get install -y vim curl zsh jq  \
tmux apt-transport-https zip unzip \
git wget gcc tree


echo '########################################'
echo 'Installing SQLite3'
echo '########################################'
echo

sudo apt-get -y install sqlite3


echo '########################################'
echo  'Install pip3'
echo '########################################'
echo

sudo apt-get -y install python3-pip


echo '########################################'
echo 'Installing Microsoft OpenJDK 21'
echo '########################################'
echo

# Valid values are only '18.04', '20.04', and '22.04'
# For other versions of Ubuntu, please use the tar.gz package
ubuntu_release=`lsb_release -rs`
wget https://packages.microsoft.com/config/ubuntu/${ubuntu_release}/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y msopenjdk-21


echo '########################################'
echo 'Installing Maven'
echo '########################################'
echo

MAVEN3_VERSION="3.9.9"
wget https://dlcdn.apache.org/maven/maven-3/${MAVEN3_VERSION}/binaries/apache-maven-${MAVEN3_VERSION}-bin.tar.gz
tar -xzvf apache-maven-${MAVEN3_VERSION}-bin.tar.gz
sudo mkdir -p /usr/local/apache-maven
sudo mv apache-maven-${MAVEN3_VERSION} /usr/local/apache-maven


echo '########################################'
echo 'Installing NVM and NodeJS LTS'
echo '########################################'
echo

NVM_VERSION="v0.40.1"
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" | bash

#source ~/.bashrc 
#nvm install --lts

echo '########################################'
echo 'Installing dotnet'
echo '########################################'
echo

sudo apt-get update &&   sudo apt-get install -y dotnet-sdk-8.0
sudo apt-get update &&   sudo apt-get install -y aspnetcore-runtime-8.0
sudo apt-get install -y dotnet-runtime-8.0



echo '########################################'
echo 'Installing DevSkim'
echo '########################################'
echo
dotnet tool install --global Microsoft.CST.DevSkim.CLI --version 1.0.51



echo '########################################'
echo 'Installing Sonar CLI' 
echo '########################################'

SONAR_ZIP_CLI="sonar-scanner"
SONAR_VERSION="6.0.0.4432-linux"
SONAR_ZIP_URL="https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_VERSION}.zip"
SONAR_FOLDER="/usr/local/sonarqube/"

curl -o "${SONAR_ZIP_CLI}.zip" "$SONAR_ZIP_URL" 
unzip "${SONAR_ZIP_CLI}.zip"
sudo mkdir -p ${SONAR_FOLDER}
sudo mv "${SONAR_ZIP_CLI}-${SONAR_VERSION}" ${SONAR_FOLDER}


echo '########################################'
echo 'Installing Snyk' 
echo '########################################'
curl --compressed  https://static.snyk.io/cli/latest/snyk-linux  -o snyk
chmod +x ./snyk
sudo mv ./snyk /usr/local/bin/


echo '########################################'
echo 'Installing Dive (Analyze Docker Images)'
echo '########################################'
echo

DIVE_VERSION="0.12.0"
wget https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb
sudo dpkg -i ./dive_${DIVE_VERSION}_linux_amd64.deb


echo '########################################'
echo 'Installing Docker' 
echo '########################################'
echo


# Install using the repository

# 1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:

sudo apt-get update

sudo apt-get -y install \
ca-certificates \
curl \
gnupg \
lsb-release


# 2. Add Docker’s official GPG key:
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# 3.Use the following command to set up the repository:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# Install Docker Engine
# 1. Update the apt package index:
sudo apt-get update

# 2. Install Docker Engine, containerd, and Docker Compose
sudo apt-get install -y docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin


# 3. Verify that the Docker Engine installation is successful by running the hello-world image:
sudo docker run hello-world

# Postinstallation

# 1. Create the docker group.
sudo groupadd docker || echo "Docker group allready exist"

# 2. Add your user to the docker group.
sudo usermod -aG docker $USER || echo "User $USER allready in docker group"





echo '########################################'
echo 'Press enter and the type exit to end the installation.'
read
echo '########################################'
echo

newgrp docker 


echo '########################################'
echo 'Bye bye...'
echo '########################################'


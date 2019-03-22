# Add snap path to paths
export PATH="/snap/bin:$PATH"

# Update apt
sudo apt update -y

# Install ifconfig related packages
sudo apt install net-tools

# Install SSH Pass
sudo apt install sshpass

# Install vim
sudo apt install vim -y

# Install Curl 
sudo apt install curl -y

# Setup vscode
# sudo snap install vscode --classic

# Install go and add go path
snap install go --classic
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
mkdir $HOME/go/src -p

# Install go dep
sudo apt install go-dep -y

# Install GCC
sudo apt install gcc -y

# Install git
sudo apt install git -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh 
sudo sh get-docker.sh
sudo rm get-docker.sh

# Install ssh server
sudo apt install -y openssh-server

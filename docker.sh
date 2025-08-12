# Remove old Docker versions if any
sudo apt remove docker docker-engine docker.io containerd runc

# Install dependencies
sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine and Compose plugin
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Check version
docker --version

sudo usermod -aG docker jenkins
sudo usermod -aG docker $USER
sudo systemctl restart jenkins


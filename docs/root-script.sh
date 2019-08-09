# Update
apt-get update
apt-get -y upgrade

# Install Basic Packages
apt-get install -y git curl build-essential
apt-get install -y build-tools libssl-dev
apt-get update

# Nginx
apt-get install -y nginx
service nginx start

# Tidy
# rm /etc/nginx/sites-available/default
# rm -rf /var/www/html
echo "<!DOCTYPE html><html><head><title>Welcome to Nginx!</title></head><body><h1>Max Smells!</h1></body></html>" > /var/www/html/index.nginx-debian.html

# Setup Excursions in Nginx
cp /vagrant_docs/excursions.test /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/excursions.test /etc/nginx/sites-enabled/excursions.test
service nginx restart

# Setup MongoDB
wget -qO - https://www.mongodb.org/static/pgp/server-4.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start

# Setup develop script
cp /vagrant_docs/develop /usr/local/bin/
chmod +x /usr/local/bin/develop

apt-get install -y unattended-upgrades

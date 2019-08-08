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
rm /etc/nginx/sites-available/default
rm -rf /var/www/html

# Setup Excursions in Nginx
cp /vagrant_docs/excursions.test /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/excursions.test /etc/nginx/sites-enabled/excursions.test
service nginx restart

apt-get install -y unattended-upgrades

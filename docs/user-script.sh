cd /home/vagrant

wget -qO- https://raw.github.com/nvm-sh/nvm/master/install.sh | sh

# This enables NVM without a logout/login
export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install --lts
nvm use --lts

npm i -g npx
npm i -g pm2
npm i -g mongodb
npm i -g concurrently

alias develop='concurrently "npm run start --prefix /var/www/excursions-frontend" "npm run dev --prefix /var/www/excursions-backend"'

# Temporary Solution to install npm packages.
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

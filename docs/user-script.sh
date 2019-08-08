cd /home/vagrant

wget -qO- https://raw.github.com/nvm-sh/nvm/master/install.sh | sh

# This enables NVM without a logout/login
export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install --lts
nvm use --lts

npm i -g npx
npm i -g forever
npm i -g mongodb

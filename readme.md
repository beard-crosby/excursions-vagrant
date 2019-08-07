# Excursions Vagrant File

## Setup Instructions (On Mac)
- Install VirtualBox and Vagrant on your computer.

VirtualBox: https://www.virtualbox.org/wiki/Downloads

Vagrant: https://www.vagrantup.com/

- In the terminal, create a directory for the vagrant box to live.

I'd suggest making it in your user root folder.

```sh
mkdir ~/vagrant
```

- Enter the new directory and clone this repo directly into it.

```sh
cd ~/vagrant
git clone https:// .
```

- Create a directory called `sites`

```sh
mkdir ~/vagrant/sites
```

This is where you will clone the sites you work on.

- Start the vagrant virtual machine.

Before we start up the vagrant box, we will install a plugin to manage the disksize. (It will be set to 20GB)

```bash
vagrant plugin install vagrant-disksize
vagrant up
```

The virtual machine will now install everything we need and begine running.

If you want, you can see its status if you open the VirtualBox app.

- SSH to the machine.

```sh
vagrant ssh
```

You will now be on the virtual machine. The directory `/var/www` will exactly mirror your mac's `~/vagrant/sites` folder.

If there were no errors in this step, carry on.

- Check that nginx is working.

In your browser, go to `192.168.33.10`.

This should open a basic page that says "Welcome to nginx!"

If it does, carry on.

- Clone the Excursions repos inside `/var/www/`

```sh
cd /var/www
git clone https://github.com/beard-crosby/excursions-frontend.git
git clone https://github.com/beard-crosby/excursions-backend.git
```

You now have a virtual machine setup with the excursions project on it. Now we need to setup nginx to be able to access them and see them in a browser.

We are going to set it up so that we can simple go to `http://excursions.test` in the browser and see the development site.

- Add the nginx configuration files.

```sh
cd /etc/nginx/sites-available
sudo cp /vagrant_docs/excursions.test .
sudo ln -s /etc/nginx/sites-available/excursions.test /etc/nginx/sites-enabled/excursions.test
sudo service nginx restart
```

- Open a new terminal window on your mac.

Then add excursions.test to your hosts file.

```
sudo nano /etc/hosts
```

Add this line to the bottom of the file you have open:
```
192.168.33.10 excursions.test
```

If you go to `http://excursions.test` in your browser now, you will probably see a blank screen. This is because the development server isn't running at the moment.

- Back in your vagrant virtual machine, start the dev servers.

```
cd /var/www/excursions-frontend
```

Then follow the instructions in the repos readme.

### Running both frontend and backend servers.
It is possible to SSH into the vagrant box multiple times at once. So open two terminal windows on your mac and run the below on both:

```sh
cd ~/vagrant
vagrant ssh
```

### If the virtual machine is running slow
Each virtual machine is allocated 2GB of RAM by default. You can increase this.

- Shutdown your vagrant box if it running.

From your mac terminal:
```sh
cd ~/vagrant
vagrant halt
```

- Open the `Vagrantfile` and find this line:

```ruby
vb.memory = "2048"
```

- Increate the number by however much you feel your computer can spare. The number is the about of MB of RAM allocated to the virtual machine while it is running.

---

## Development

- Open two windows on your mac terminal.

- On one:
```sh
cd ~/vargrant
vagrant up
vagrant ssh

# Wait for the machine to load

cd /var/www/excursions-frontend
# Run the development server
```

- On the other terminal window
```sh
cd ~/vagrant
vagrant ssh

# Wait for the machine to load

cd /var/www/excursions-backend
# Run the development server
```

> I will create a script that will run both dev servers from one window in the future.

---

## How it works

On the virtual machine, the directory `/var/www/` is where websites go. In order to access and work on the sites there, vagrant will mirror that directory to the `~/vagrant/sites/` folder on your mac. So all you need to do is work on the sites in VS Code that are inside the `~/vagrant/sites/` folder.

But you will need to run any dev servers from inside the vagrant virtual machine.

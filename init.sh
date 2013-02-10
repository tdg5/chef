#!/bin/bash -e

current_user=`whoami`
current_user_safe=`echo $current_user | sed -u 's/\./_dot_/'`
echo "$current_user ALL=NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$current_user_safe
sudo chmod 0440 /etc/sudoers.d/$current_user
sudo apt-get install -y build-essential git ruby1.9.3 rubygems
sudo gem1.9.3 install --no-ri --no-rdoc chef
sudo mkdir -p /var/log/tdg5_chef
sudo chown -R $current_user:$current_user /var/log/tdg5_chef

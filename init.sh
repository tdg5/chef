#!/bin/bash -e

if [ $EUID -ne 0 ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

user=$SUDO_USER
user_safe=`echo $user | sed -u 's/\./_dot_/'`
[ -f /etc/sudoers.d/$user_safe ] || echo "$user ALL=NOPASSWD:ALL" | tee /etc/sudoers.d/$user_safe
$(stat /etc/sudoers.d/$user_safe | sed -n '4p' | grep -q 'Access: (0440') || chmod 0440 /etc/sudoers.d/$user_safe

for pkg in build-essential git ruby ruby-dev; do
  $(dpkg -s $pkg > /dev/null 2>&1) || apt-get install -y $pkg
done

for user_dir in $HOME/src; do
  [ -d $user_dir ] || mkdir -p $user_dir
done

[ -d $HOME/src/tdg5_chef ] || git clone --recursive https://github.com/tdg5/chef.git $HOME/src/tdg5_chef

for user_dir in  $HOME/src; do
  $(ls -altrd $user_dir | grep -q "$user $user") || chown -R $user:$user $user_dir
done

cd $HOME/src/tdg5_chef

gem list --local | grep -q '^bundler (' || gem install bundler

bundle

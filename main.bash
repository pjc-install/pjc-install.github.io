#! /usr/bin/env bash


echo '
#####################################################################
#####################################################################

	main.bash

	usage:
		curl -Ls pjc-install.github.io/main.bash | bash

#####################################################################
#####################################################################
'
# this only runs on ubuntu and it's derivatives, see /etc/os-release
# define is_os_ubuntu_like()
eval "$(curl -Ls pjc-install.github.io/is_os_ubuntu_like.bash)"
if ! is_os_ubuntu_like ; then
	echo "ERROR: OS must be ubuntu like"
	exit 1
fi


echo "===> [1]-beg basic update, upgrade"
sudo apt-get update
sudo apt-get upgrade
echo "===> [1]-end basic update, upgrade"



echo "===> [1]-beg some nice prerequsites before turning over setup to ansible"
sudo install mc
# eget is a marvellous single binary installer from the maker of micro
# [source](https://github.com/zyedidia/eget)
curl https://zyedidia.github.io/eget.sh | sh
eget micro
echo "===> [1]-end some nice prerequsites before turning over setup to ansible"

# some nice prerequsites before turning over setup to ansible


# you need pip before you can install ansible
# ref:
#   https://linuxize.com/post/how-to-install-pip-on-ubuntu-20.04/
#sudo apt-get update
#sudo -H apt-get install python3-pip


# eget is a marvellous single binary installer from the maker of micro
# src:
#   [source](https://github.com/zyedidia/eget)
#curl https://zyedidia.github.io/eget.sh | sh



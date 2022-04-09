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

# ##############################################################################
echo "===> [1] beg | create tmp bashrc-bootstrap.bash"

bashrc_bootstrap_pathname="${HOME}/bashrc-bootstrap.bash"
echo  "# created by pjc-install.github.io/main.bash $(date +%s)"   > ${bashrc_bootstrap_pathname}

if ! grep -q "bashrc-bootstrap" "${HOME}/.bashrc"; then
	# .bashrc doesn't contain 'bashrc-bootstrap', so set it up source
	# bashrc_bootstrap_pathname, for repeatability during debug and tweaking
	# after full setup this should be removed from .bashrc !!!
	echo  "#######################################################" >> ${HOME}/.bashrc
	echo  "# pjc, FIXME FIXME FIXME tmp bashrc-bootstrap for setup" >> ${HOME}/.bashrc
	echo  "#######################################################" >> ${HOME}/.bashrc
	echo  "source ${bashrc_bootstrap_pathname}"                     >> ${HOME}/.bashrc
fi
echo "===> [1] end | create tmp bashrc-bootstrap.bash"




# ##############################################################################
echo "===> [2] beg | basic update, upgrade"
sudo apt-get update
sudo apt-get upgrade
echo "===> [2] end | basic update, upgrade"


# ##############################################################################
echo "===> [3] beg | some nice prerequsites before turning over setup to ansible"
echo "export PATH=${HOME}/.local/bin:${PATH}" >> ${HOME}/bashrc-bootstrap.bash
export PATH="${HOME}/.local/bin:${PATH}"

sudo install mc
read -p "Press enter to continue"

# eget is a marvellous single binary installer from the maker of micro
# [source](https://github.com/zyedidia/eget)
curl https://zyedidia.github.io/eget.sh | sh
read -p "Press enter to continue"

# downloads eget to current dir
mv ./eget ${HOME}/.local/bin

read -p "Press enter to continue"

# eget zyedidia/micro
# --asset='linux64.tar.gz' is required to avoid getting choice to install static
# eget not designed for scripting !! but nice anyway
eget  zyedidia/micro --asset='linux64.tar.gz' --to ${HOME}/.local/bin

read -p "Press enter to continue"
echo "===> [3] end | some nice prerequsites before turning over setup to ansible"
read -p "Press enter to continue"



# ##############################################################################
# you need pip before you can install ansible
# ref:
#   https://linuxize.com/post/how-to-install-pip-on-ubuntu-20.04/
#sudo apt-get update
#sudo -H apt-get install python3-pip


# eget is a marvellous single binary installer from the maker of micro
# src:
#   [source](https://github.com/zyedidia/eget)
#curl https://zyedidia.github.io/eget.sh | sh



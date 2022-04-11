#! /usr/bin/env bash

# ref:
#   https://linuxize.com/post/how-to-install-pip-on-ubuntu-20.04/


function install_python3_tools() {

	echo
  echo "python3 tools"
  echo "====> START: install_python3_tools()"

  set -x

  # install pip using apt at sudo
	sudo apt-get -y update
	sudo -H apt-get -y install python3-pip

	# use pip to upgrade pip because package likely behind
	sudo -H pip3    install --upgrade pip

	# python3 dev tools
	# python-dev contains everything needed to compile python extension modules
  sudo apt-get -y install python3-dev

  # python3-apt supports ansible apt installing
  # https://stackoverflow.com/questions/63680554/ansible-install-python3-apt-package
  sudo apt-get -y install python3-apt

	set +x

  echo
  echo "====> DONE: install_python3_tools()"
  echo
}






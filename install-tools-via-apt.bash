#! /usr/bin/env bash

# collection of useful tools pre config or very basic setup

function install_tools_via_apt() {

	echo
  echo "tools via apt"
  echo "====> START: install_tools via apt()"

  set -x

  # manage apt repositories including ppa
  sudo apt-get -y install software-properties-common


  # install pip using apt at sudo
	sudo apt-get -y update
	sudo apt-get -y install xclip dos2unix mc curl wget pcregrep
  sudo apt-get -y install ipcalc sipcalc nmap htop fping pv
  # disk related tools
	sudo apt-get -y install pydf ncdu

	set +x


  echo ' '                                              >> "${bashrc_bootstrap_pathname}"
  echo '# >> BEGIN >> insert by install-hstr.bash  >>'  >> "${bashrc_bootstrap_pathname}"
  hstr --show-configuration                             >> "${bashrc_bootstrap_pathname}"
  echo '# >> END   >> insert by install-hstr.bash  >>'  >> "${bashrc_bootstrap_pathname}"
  echo ' '                                              >> "${bashrc_bootstrap_pathname}"

  # always wrap mc so it cd to cwd on exit, lets you cd around
  alias mc='. /usr/share/mc/bin/mc-wrapper.sh'




  echo
  echo "====> DONE: install_tools via apt()"
  echo
}








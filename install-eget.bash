#! /usr/bin/env bash


# eget is a marvellous single binary installer from the maker of micro
# [source](https://github.com/zyedidia/eget)

function install_eget() {

	echo
  echo "eget"
  echo "====> START: install_eget()"

  set -x

	curl https://zyedidia.github.io/eget.sh | sh

	# downloads eget to current dir so mv
	mv ./eget ${HOME}/.local/bin

	set +x

  echo
  echo "====> DONE: install_eget()"
  echo
}

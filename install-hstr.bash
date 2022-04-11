#! /usr/bin/env bash

# https://github.com/dvorka/hstr

# HSTR (HiSToRy) is a command line utility that brings improved
# bash/zsh command completion from the history. It aims to make
# completion easier and more efficient than Ctrl-r.

# HSTR can also manage your command history (for instance you can
# remove commands that are obsolete or contain a piece of sensitive
# information) or bookmark your favorite commands.


# legacy installation on pre Ubuntu 21.10
# ---------------------------------------
# older releases, pre ubuntu 21.10, are installed via a ppa
# set this to True to install via ppa
HSTR_INSTALL_OLD=False

function install_hstr() {
	local bashrc_bootstrap_pathname="${1:-${HOME}/bashrc-bootstrap}"


	# ref:
	#   https://dvorka.github.io/hstr/

	echo
  echo "hstr"
  echo "====> START: install_hstr()"

  set -x

  if [[ "${HSTR_INSTALL_OLD}" == False ]]; then
		# HSTR is included in Ubuntu 21.10 and newer releases:
		sudo apt install hstr
	else
		# older releases, pre 21.10
		sudo add-apt-repository ppa:ultradvorka/ppa
		sudo apt-get update
		sudo apt-get install hstr
	fi

	set +x

  echo ' '                                              >> "${bashrc_bootstrap_pathname}"
  echo '# >> BEGIN >> insert by install-hstr.bash  >>'  >> "${bashrc_bootstrap_pathname}"
	hstr --show-configuration                             >> "${bashrc_bootstrap_pathname}"
  echo '# >> END   >> insert by install-hstr.bash  >>'  >> "${bashrc_bootstrap_pathname}"
  echo ' '                                              >> "${bashrc_bootstrap_pathname}"

  echo
  echo "====> DONE: install_hstr()"
  echo
}








#! /usr/bin/env bash

function is_os_ubuntu_like() (
	# () not {} so always runs in subshell to avoid cluttering
	# up env with /etc/os_release vars
	# returns 0 if os is a derivative of ubuntu, 1 otherwise
	source /etc/os-release

	# echo "ID:      ${ID}"
	# echo "ID_LIKE: ${ID_LIKE}"

	# set nocasematch option for bash regex =~
	shopt -s nocasematch
	if [[ "${ID}" =~ .*ubuntu.* || "${ID_LIKE}" =~ .*ubuntu.* ]]; then
		echo True
		return 0
	else
		echo False
		return 1
	fi


)

# is_os_ubuntu_like


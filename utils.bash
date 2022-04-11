#! /usr/bin/env bash


############################################################
## utils for installer
#

function mk_tmp_install_dir() {
	# create a tmp dir and echo path
	# append date-time stamp
	local dirpath="/tmp/${USER}/boostrap-install-$(date +%Y%m%d-%H%M.%S)"
	mkdir -p "${dirpath}"
	echo "${dirpath}"
}


function press_any_key_to_continue() {
  local msg="${1:-'press any key to continue...'}"

  # ref:
  #   https://unix.stackexchange.com/questions/293940/bash-how-can-i-make-press-any-key-to-continue
  # -n 1 required char count before stop read
  # -s   hide the input
  # -r   read raw, so can ignore \ as escape which would required 2 chars to continue
  # -p   prompt
  read -n 1 -s -r -p "${msg}"
  echo
}

function ask_yes_or_no() {
  local msg="$1"
  # echos
  #  "yes" or "no"
  #  "no" by default
  # everything except "y" or "yes" returns "no"
  # case insensitive, "Y", "Yes", or "YES" work as "yes"
  # doesn't loop, if it is not yes, then its no
  # ref:
  #   https://stackoverflow.com/questions/1885525/how-do-i-prompt-a-user-for-confirmation-in-bash-script

  local prompt response
  if [[ -z "${msg}" ]]; then
    prompt="[y]es or [n]o : "
  else
    prompt="${msg} ([y]es or [n]o) : "
  fi

  read -p "${prompt}" response

  # use tr to convert case to lower case
  # only yes or y will return 'yes', everything is 'no'
  case $(echo "${response}" | tr '[A-Z]' '[a-z]') in
      y|yes) echo "yes" ;;
      *)     echo "no" ;;
  esac
}


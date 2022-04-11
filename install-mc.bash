#! /usr/bin/env bash


function install_mc() {

	echo
  echo "mc"
  echo "====> START: install_mc()"

  [[ -z "$(which micro)" ]] || echo "====> WARNING requires micro"

  set -x

	sudo apt-get -y update
	sudo apt-get -y install mc

  set +x

  local mc_alias_mc_wrapper="
# always wrap mc so it cd to cwd on exit, lets you cd around
alias mc='. /usr/share/mc/bin/mc-wrapper.sh'

"

  local mc_set_micro_as_default_editor="
# set mc default editor F4 to micro
# ref: https://askubuntu.com/questions/16776/how-to-switch-the-editor-in-mc-midnight-commander-from-nano-to-mcedit
export EDITOR=${HOME}/local/bin/micro mc

"

  # actually insert the mc related settings into bashrc-bootstrap
  echo ' '                                              >> "${bashrc_bootstrap_pathname}"
  echo '# >> BEGIN >> insert by install-mc.bash  >>'    >> "${bashrc_bootstrap_pathname}"
  echo "${mc_alias_mc_wrapper}"                         >> "${bashrc_bootstrap_pathname}"
  echo "${mc_set_micro_as_default_editor}"              >> "${bashrc_bootstrap_pathname}"
  echo '# >> END   >> insert by install-mc.bash  >>'    >> "${bashrc_bootstrap_pathname}"
  echo ' '                                              >> "${bashrc_bootstrap_pathname}"


  echo
  echo "====> DONE: install_mc()"
  echo
}








#! /usr/bin/env bash


function install_micro() {
	local bashrc_bootstrap_pathname="${1:-${HOME}/bashrc-bootstrap}"

	# dowloads and installs micro into ~/.local/bin
	# updates ${bashrc_bootstrap_pathname} so that mc uses micro as F4 editor
	# assumes
	#		- that eget has already been installed
	# 	- that xclip has already been installed


  # micro
  # ref:
  #   https://micro-editor.github.io/
  #   https://github.com/benweissmann/getmic.ro

  echo
  echo "micro"
  echo "====> START: install_micro()"

  if [[ -z $(which eget) ]]; then
    echo "ERROR: FATAL requires eget, eget not found on \${PATH}"
    exit 1
  fi

  [[ -z "$(which xclip)" ]] || echo "WARNING: requires xclip"


  set -x

	# eget zyedidia/micro
  # -------------------
  # install into ~/.local/bin, which is assumed to be on PATH
	# --asset='linux64.tar.gz' is required to avoid getting choice to install static
	# eget not designed for scripting !! but nice anyway
	eget  zyedidia/micro --asset='linux64.tar.gz' --to ${HOME}/.local/bin

  # creates bindings.json to deal with key binding issue inside tmux
  # see micro-tmux-keybinding-issue.md and
  # ref: https://github.com/zyedidia/micro/issues/983

  # this is not working for me! 2020.05 in terminator???
  # ----------------------------------------------------
  local micro_keybindings='
{
    "\u001b[1;2A": "SelectUp",
    "\u001b[1;2B": "SelectDown",
    "\u001b[1;2C": "SelectRight",
    "\u001b[1;2D": "SelectLeft",
    "\u001b[1;3D": "WordLeft",
    "\u001b[1;3C": "WordRight",
    "\u001b[1;3A": "MoveLinesUp",
    "\u001b[1;3B": "MoveLinesDown",
    "\u001b[1;4C": "SelectWordRight",
    "\u001b[1;4D": "SelectWordLeft",
    "\u001b[1;5D": "StartOfLine",
    "\u001b[1;5C": "EndOfLine",
    "\u001b[1;6D": "SelectToStartOfLine",
    "\u001b[1;6C": "SelectToEndOfLine",
    "\u001b[1;5A": "CursorStart",
    "\u001b[1;5B": "CursorEnd",
    "\u001b[1;6A": "SelectToStart",
    "\u001b[1;6B": "SelectToEnd"
}
'
  local micro_config_path=${HOME}/.config/micro
  mkdir -p ${micro_config_path}

  local micro_config_key_bindings_path=${micro_config_path}/bindings.json

  set +x

  echo "$micro_keybindings" > ${micro_config_key_bindings_path}

  set -x

  # .bashrc inserts for micro
  local micro_clipboard='
# micro can use X selection XA_PRIMARY as clipboard but only if
# xclip -o returns 0
# see
#  https://github.com/zyedidia/clipboard/commit/7b4ccc9435f89956bfa9466c3c42717df272e3bd#diff-ab280c3a28802fdfd330b288bc1c00b6
if ! $(xclip -o > /dev/null 2>& 1) ; then
  # nothing in XA_PRIMARY so put some dummy text in it
  # this will make xclip -o return 0
  echo "ensure x selection xa_primary is not empty for micro" | xclip
fi

'


  # actually insert the micro editor inserts to bashrc-bootstrap
  set +x
  echo ' '                                              >> "${bashrc_bootstrap_pathname}"
  echo '# >> BEGIN >> insert by install-micro.bash  >>' >> "${bashrc_bootstrap_pathname}"
  echo "${micro_clipboard}"                             >> "${bashrc_bootstrap_pathname}"
  echo '# >> END   >> insert by install-micro.bash  >>' >> "${bashrc_bootstrap_pathname}"
  echo ' '                                              >> "${bashrc_bootstrap_pathname}"

  echo
  echo "====> DONE: install_micro()"
  echo
}


# Inserts 'sudo ' at the beginning of the line.
function prepend-sudo {
  if [[ "$BUFFER" != su(do|)\ * ]]; then
    BUFFER="sudo $BUFFER"
    (( CURSOR += 5 ))
  fi
}
zle -N prepend-sudo

# Insert 'sudo ' at the beginning of the line.
bindkey -M "emacs" "\C-X\C-S" prepend-sudo
bindkey -M "emacs" "C-A" beginning-of-line

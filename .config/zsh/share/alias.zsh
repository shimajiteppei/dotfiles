##
## alias
##

alias alias='abbr --session --global --quieter --force'
abbr clear-session
alias history="history 0"
alias grep='grep --color=auto'
alias ll='ls -lahF --color'
alias cp='cp -i'
alias mv='mv -i'
alias rm='mv -t $XDG_DATA_HOME/Trash/files'
alias mkdir='mkdir -p'
alias g='git'
alias gs='git status'
# https://zsh-abbr.olets.dev/commands.html#git
alias git ap='add -p'
alias git b='branch'
alias git ch='checkout'
alias git clone='clone --recurse-submodules'
alias git cm='commit -m'
alias git config='config --local'
alias git s='status'


##
## fast-syntax-highlighting highlighting of abbreviations (https://github.com/olets/zsh-abbr/issues/24)
##

chroma_single_word() {
  (( next_word = 2 | 8192 ))

  local __first_call="$1" __wrd="$2" __start_pos="$3" __end_pos="$4"
  local __style

  (( __first_call )) && { __style=${FAST_THEME_NAME}alias }
  [[ -n "$__style" ]] && (( __start=__start_pos-${#PREBUFFER}, __end=__end_pos-${#PREBUFFER}, __start >= 0 )) && reply+=("$__start $__end ${FAST_HIGHLIGHT_STYLES[$__style]}")

  (( this_word = next_word ))
  _start_pos=$_end_pos

  return 0
}

# register single word command execpt for the followings:
# - already in PATH
# - already in fast-syntax-highlighting chroma map
register_single_word_chroma() {
  local word=$1
  if [[ -x $(command -v $word) ]] || [[ -n $FAST_HIGHLIGHT["chroma-$word"] ]]; then
    return 1
  fi

  FAST_HIGHLIGHT+=( "chroma-$word" chroma_single_word )
  return 0
}


if [[ -n $FAST_HIGHLIGHT ]]; then

  for abbr in ${(f)"$(abbr list-abbreviations)"}; do
    if [[ $abbr != *' '* ]]; then
      register_single_word_chroma ${(Q)abbr}
    fi
  done

fi


#
# dotfiles
#
dotfiles-update() {
  cd $HOME
  git submodule update --recursive
  zinit self-update
  $XDG_DATA_HOME/fzf/install --bin
  cd -
}

dotfiles-check() {
  $XDG_DATA_HOME/xdg-ninja/xdg-ninja.sh
}

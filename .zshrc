# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pakel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls="eza --icons"
alias wrc="warp-cli connect"
alias wrd="warp-cli disconnect"
alias wrs="warp-cli status"
alias ff="fastfetch"
alias p="ping 8.8.8.8"

# Load plugins zsh
PLUGINS_ZSH="$HOME/.zsh_plugins"
for plugin in $PLUGINS_ZSH/*; do
  source "$plugin/$(basename $plugin).zsh"
done

eval "$(starship init zsh)"

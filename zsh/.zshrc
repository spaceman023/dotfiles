# Path to your oh-my-zsh installation.
export ZSH="/Users/johnrichardson/.oh-my-zsh"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/14/bin
ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git zsh-autosuggestions zsh-z)
neofetch
source $ZSH/oh-my-zsh.sh
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
  alias ll="exa -la"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

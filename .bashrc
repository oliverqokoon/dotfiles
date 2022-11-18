alias ls="ls --color"
alias ll="ls -lah --color"
alias l="ls -lh --color"
alias brew-up="brew update && brew upgrade"
alias ggrep="git grep"
alias vim="nvim"

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# Set dot files as env variables
export VIMRC="/Users/oliverh/.vimrc"
export BASHRC="/Users/oliverh/.bashrc"

# Kubernetes bash-completion
source <(kubectl completion bash)
source <(minikube completion bash)

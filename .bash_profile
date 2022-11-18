# Update PATH to include pip modules for python
PATH=$PATH:/Users/oliverh/Library/Python/3.8/bin

# Adds bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Adds bash-completion for docker
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export PATH="/Users/oliverh/go/bin:/usr/local/opt/python@3.10/bin:$PATH"
export PATH="$PATH:/Users/oliverh/.dotnet/tools"

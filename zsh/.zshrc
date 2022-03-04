
path+=($HOME/.local/bin)
path+=($HOME/basilisk/src)
fpath+=~/.zfunc

export PATH
export BASILISK=$HOME/basilisk/src


ZSH_THEME="powerlevel10k/powerlevel10k"
export ZSH=$HOME/.oh-my-zsh


export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

export TERMINFO=/usr/share/terminfo


# load plugins
plugins=(zsh-syntax-highlighting zsh-autosuggestions)

#if [[ -z "$STY" ]]; then
#    screen -xRR my_session
#    echo "started my_session"
#fi

source $ZSH/oh-my-zsh.sh
autoload svg2png
autoload rsynnn
autoload rsyncc
autoload winhide
autoload jl
autoload ss
autoload py
autoload -Uz colors && colors
autoload -U zmv
alias mmv='noglob zmv -W'
alias ls="exa -s name"
alias l="ls -lh"
alias ll="l -a"
alias cat="bat"
alias rsync="rsync -h --progress"
alias vim="nvim"
alias o='xdg-open'
alias c="clear"
alias chistory='echo "" > ~/.zsh_history & exec $SHELL -l'
alias :q="exit"
alias :Q="exit"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#export prompt='%n%F{red}@%f%m $'

source ~/.myenv/bin/activate 
cd $HOME
source ${HOME}/.config/ranger/scripts/shell_automatic_cd.sh
alias rr="ranger_cd"
archey3


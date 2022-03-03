# Enable Powerlevel10k instant prompt. 
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


path+=($HOME/.local/bin)
path+=($HOME/basilisk/src)
fpath+=~/.zfunc

export PATH
export BASILISK=$HOME/basilisk/src
export ZSH="/$HOME/.oh-my-zsh"
#required by gephi
export LIBGL_ALWAYS_SOFTWARE=1
export TERMINFO=/usr/share/terminfo
export EDITOR=nvim
if [[ $(uname -n) == "carmona-notebook" ]]
then
    export TERM="alacritty"
    alias hostname="hostname.exe"
fi
if [[ "${TERM}" != "" && "${TERM}" == "alacritty" ]]
then
    precmd()
    {
        # output on which level (%L) this shell is running on.
        # append the current directory (%~), substitute home directories with a tilde.
        # "\a" bell (man 1 echo)
        # "print" must be used here; echo cannot handle prompt expansions (%L)
        print -Pn "\e]0;$(id --user --name)@$(hostnamectl hostname): zsh[%L] %~\a"
    }

    preexec()
    {
        # output current executed command with parameters
        echo -en "\e]0;$(id --user --name)@$(hostnamectl hostname): ${1}\a"
    }
fi
ZSH_THEME="powerlevel10k/powerlevel10k"

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


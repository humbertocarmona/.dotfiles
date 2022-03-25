# Start X at login
set fish_greeting "fishing with $TERM .."
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        # exec startx -- -keeptty
    end
end

if status is-interactive
    fish_add_path -g $HOME/.local/bin
    source $HOME/.config/fish/scripts/zoxide.fish
    source $HOME/.config/fish/scripts/spot.fish
    source $HOME/.config/ranger/scripts/ranger_cd.fish
    source $HOME/.config/lf/icons
    source $HOME/.config/fish/scripts/gitaddrem.fish
    source $HOME/.config/fish/scripts/br.fish
    export CCHEFE="$HOME/Projetos/Cientista-Chefe/"
    export ANALISE="$HOME/Projetos/Cientista-Chefe/COVID/analysis/"
    export PREPRO="$HOME/Projetos/Cientista-Chefe/COVID/preprocessaISUS/"
end

alias g='lazygit'
alias nvimrc='nvim ~/.config/nvim/lua/user/'
alias fishrc='nvim ~/.config/fish/config.fish'
alias bspwmrc='nvim ~/.config/bspwm/bspwmrc'
alias polybarrc='nvim ~/.config/polybar/config.ini'
alias picomrc='nvim ~/.config/picom/picom.conf'
alias xkbrc='nvim ~/.config/sxhkd/sxhkdrc'
alias lfrc='nvim ~/.config/lf/lfrc'
alias lf='~/.local/bin/lfrun'
alias fgrep='fgrep --color=auto'
alias cdwm="nvim ~/.config/dwm-hac"

alias rev="xinput set-prop 'MX Anywhere 2S Mouse' 315 1" 

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrorb="sudo reflector -c Brazil -f 10 -l 10 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Remarkable
alias @ease='ssh 192.168.15.63'
export EASE='192.168.15.63'



# confirm before overwriting something
alias mv='mv -i'
alias rm='rm -i'
# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'
# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'
alias pse='ps -f'

# For when keys break
alias archlinx-fix-keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"

alias l='exa -lh'
alias ll='l -a'
alias x='startx'
alias fvim="nvim (fzf --height=40% --reverse)"
alias rmusb='udiskie-umount -d /dev/sda1'
alias q='exit'

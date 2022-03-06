if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias g='lazygit'
alias nvimrc='nvim ~/.config/nvim/'

# alias lvim='nvim -u ~/.local/share/lunarvim/lvim/init.lua --cmd "set runtimepath+=~/.local/share/lunarvim/lvim"'

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrorb="sudo reflector -c Brazil -f 10 -l 10 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Remarkable
alias @ease='ssh 192.168.15.63'
export EASE='192.168.15.63'
# alias restream='restream -p'

# Colorize grep output (good for log files)
alias rg='rg -.'
alias grep='rg'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'


alias pse='ps -ef'
# For when keys break
alias archlinx-fix-keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"

alias l='exa -lh'
alias ll='l -a'
alias cat='bat'
alias :q='exit'
alias :Q='exit'
alias mmv='noglob zmv -W'
alias paru='paru --skipreview'

cd $HOME

sudo pacman -S git 
alacritty
bat
blueman
bluez
bluez-utils
broot
composer
cppcheck
dmenu
dunst
eslint
exa
fd
feh
fish
flake8
flameshot
fzf
gimp
git
helvum
htop
inkscape
julia
kitty
krita
lazygit
luarocks
lxappearance
mpd
nautilus
neovim
network-manager-applet
nitrogen
okular
papirus-icon-theme
perl-file-mimeinfo
picom
prettier
pyright
python
python-pip
python-pynvim
python-setuptools
python-virtualenv
python-virtualenvwrapper
qgis
ranger
reflector
ripgrep
rofi
rsync
ruby
stow
sxiv
texlive-publishers
texlive-science
tmux
trash-cli
udiskie
ueberzug
unclutter
usbutils
vlc
wget
xdg-utils
xclip
zathura
zoxide
zsh

git clone https://aur.archlinux.org/yay.git
cd yay 
makepakg -si
cd .. 
rm -rf yay


yay -S 
brave-bin
dragon-drop-git
google-chrome
lf-git
nerd-fonts-hack
onlyoffice-bin
python-graph-tool
texlive-latexindent-meta
virtualfish
yay-cache-cleanup-hook


systemctl --user start pipewire-pulse.service
systemctl --user enable pipewire-pulse.service

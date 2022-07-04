sudo pacman -S git 
broot
bat
dmenu
dunst
exa
fd
fish
flameshot
fzf
kitty
lazygit
mpd
neovim
nitrogen
pamixer
perl-file-mimeinfo
picom
ranger
reflector
ripgrep
rofi
rsync
stow
sxiv
tmux
trash-cli
udiskie
ueberzug
unclutter
unzip
xclip
zoxide

git clone https://aur.archlinux.org/yay.git
cd yay 
makepakg -si
cd .. 
rm -rf yay


yay -S dragon-drop-git
lf
nerd-fonts-hack
onlyoffice-bin
svg2png
google-chrome
yay -S python python-virtualenv julia flake8 nodejs npm prettier pyright cppcheck  eslint python-pip  python-pynvim  python-setuptools lua luarocks ruby php composer
sudo pacman -S bluez bluez-utils blueman
sudo pacman -S usbutils
sudo pacman -S helvum
systemctl --user start pipewire-pulse.service
systemctl --user enable pipewire-pulse.service

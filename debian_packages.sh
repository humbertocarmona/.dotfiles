G#! /bin/sh

sudo apt install bat \
	blueman \
	cmake \
	curl \
	dunst \
	exa \
	fd-find \
	fish \
	fzf \
	gfortran \
	git \
	imagemagick \
	jq \
	kitty \
	lf \
	libluajit2-5.1-2 \
	luarocks \
	make \
	nm-tray \
	nodejs \
	npm \
	openmpi-bin \
	openmpi-common \
	pamixer \
	ranger \
	ripgrep \
	rsync \
	stow \
	sway \
	sway-backgrounds \
	sway-notification-center \
	swaylock \
	tmux \
	tmux-plugin-manager \
	tmux-themepack-jimeh \
	tmuxinator \
	waybar \
	wl-clipboard \
	wofi \
	wofi-pass \
	zoxide \
	zsh \
	python3-pip \
	python3-venv \
	silversearcher-ag \
	trash-cli \
	vim \
	udiskie

# nerdfonts
cdir=$(pwd)
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
for f in RobotoMono Inconsolata Hack SourceCodePro; do
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/$f.zip
	unzip -o $f.zip
	rm $f.zip
done
fc-cache
cd $cdir

# python virtual environment
mkdir -p ~/.virtualenvs
python3 -m venv .virtualenvs/p3venv
~/.virtualenvs/p3venv/bin/python3 -m pip install virtualfish

#lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# neovim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
rm ./nvim-linux64.deb
sudo npm install tree-sitter

# brave browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# julia - need to update packages manually
cd /opt
sudo wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.5-linux-x86_64.tar.gz
sudo tar xf julia-1.8.5-linux-x86_64.tar.gz
sudo rm julia-1.8.5-linux-x86_64.tar.gz
sudo update-alternatives --install /usr/bin/julia julia-1.8.5 /opt/julia-1.8.5/bin/julia 300

# special libraries
cd $cdir
sudo apt install libpetsc64-complex3.18-dev libpetsc64-real3.18-dev slepc64-dev

# manage fish plugins
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish

sudo update-alternatives --install /usr/bin/bat batcat /usr/bin/batcat 300
sudo update-alternatives --install /usr/bin/fd fdfind /usr/lib/cargo/bin/fd 300
sudo apt install golang-go

wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.335/quarto-1.2.335-linux-amd64.deb
apt instal ./quarto-1.2.335-linux-amd64.deb
sudo apt install librsvg2-2 librsvg2-bin
sudo mkdir -m755 -p /etc/apt/keyrings/
sudo wget -O /etc/apt/keyrings/qgis-archive-keyring.gpg https://download.qgis.org/downloads/qgis-archive-keyring.gpg
sudo apt update
sudo apt install qgis qgis-plugin-grass qgis-server

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg |
	gpg --dearmor |
	sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' |
	sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium
sudo apt install pdfsam
sudo apt install xournalpp
sudo apt install texlive-latex-recommended texlive-luatex texlive-pstricks
sudo apt install equalx

.dotfiles

Installing
You will need git and GNU stow

Clone into your $HOME directory or ~

git clone https://github.com/humbertocarmona/.dotfiles.git ~
Run stow to symlink everything or just select what you want

stow */ # Everything (the '/' ignores the README)
stow zsh # Just my zsh config

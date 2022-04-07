# hac's build of dwm

- Reads [xresources](https://dwm.suckless.org/patches/xresources/) colors/variables (i.e. works with `pywal`, etc.).

## Installation
```
git clone https://github.com/humbertocarmona/dwm-hac
cd dwm-hac
sudo make install
```

## Please install `libxft-bgra`!


- Place the script `sysact` somewhere in your path, my version is in 
  on my  [dotfiles](https://github.com/humbertocarmona/.dotfiles)

This build of dwm does not block color emoji in the status/info bar, so you must install [libxft-bgra](https://aur.archlinux.org/packages/libxft-bgra/) from the AUR, which fixes a libxft color emoji rendering problem, otherwise dwm will crash upon trying to render one. Hopefully this fix will be in all libxft soon enough.

# .dotfiles

![.dotfiles image](./dotfiles.png)

## Installing

You will need `git` and GNU `stow`

Clone into your `$HOME` directory or `~`

This started from 
```bash
git clone https://github.com/ChristianChiarulli/Machfiles.git ~
```


```bash
git clone https://github.com/humbertocarmona/.dotfiles.git ~
```

Run `stow` to symlink everything or just select what you want

```bash
stow */ # Everything (the '/' ignores the README)
```

```bash
stow zsh # Just my zsh config
```


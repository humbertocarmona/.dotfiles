# install reflector and update tiagopeixoto/graph-tool:latest 
# (with arch python jupyter)
# then install neovim
FROM tiagopeixoto/graph-tool

USER root
RUN pacman -S reflector --noconfirm
RUN reflector -c brazil -l 5 --sort rate --save /etc/pacman.d/mirrorlist

RUN pacman -Syu --noconfirm && \
    pacman -S neovim --noconfirm && \
    pacman -S base-devel --noconfirm && \
    pacman -S tmux --noconfirm && \ 
    pacman -S git --noconfirm  && \ 
    pacman -S python-pip --noconfirm && \
    pacman -S python-wheel --noconfirm

USER user
RUN mkdir -p /home/user/.config/nvim
COPY --chown=user:user . /home/user/.config/nvim

WORKDIR "/home/user/app"


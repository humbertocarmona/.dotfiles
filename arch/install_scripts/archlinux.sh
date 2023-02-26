#!/bin/sh

# if you are dual booting start in windows
# -- disable secure boot and pass startup 
# -- create space to install arch
#       open disk management
#       shrink volume --- may have a problem with encrypted disk
#       take note of the windows partitions (including the one you created...)
# boot the iso and proceed to install base ... took for <<<<<<< to schanges


#   1) load keymap
#       to list avalable keymaps you can use 
#       '> localectl list-keymaps | grep br'
loadkeys br-abnt2

#   2) check if tou hav an ip
#       '> ip a'
#       you can use '> wifi-menu'  to connect to wifi if you need

#   3) syn network time protocol
timedatectl set-ntp true 

#   4) take care of the mirror list
pacman -Syyy
pacman -S reflector
reflector -c Brazil -a 12 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syyy 

#   5) partition the disk
#   '> lsblk' will show you the disks avalable
#   <<<<<<<<<<<<<<<<<<<<<<<<<<<
#           windows already have an efi partition !!!
#
#           you can use cfdisk - the info will be better
#           select your free space and create a single (root) partition
#           jumpt to format
#           mkfs.ext4 /dev/sda5 (the one you just created)
#           mount /dev/sda5 /mnt 
#           mkdir /mnt/boot
#           mount /dev/sda2 /mnt/boot  --- the windows EFI partition)
#           mkdir /mnt/windows11
#           mount /dev/sda4 /mnt/windows11 --- the windows basica data partition
#           and proceed to 6) pacstrap
#   <<<<<<<<<<<<<<<<<<<<<<<<<<<
#   for an EFI system you need at leas efi and main partitions
#   '> fdisk /dev/sda'
#
#   fdisk will greet you,
#   it shoud look like 
#   "Command (m for help): g"  -- create a new GPT partition 
#
#   "Command (m for help): n"  -- n for new
#   "Partition number (1-128, default 1): 1"-- accept the default
#   "First sector (2048-large number, default 2048): 2048"-- accept the default
#   "Last sector, +/-sectos or +/-size{K,M,G,T,P} (2048-large number, default large): +200M" -- to create a 200MB EFI partition
#   "Command (m for help): t" -- to change type
#   "Partition type (type L to list all types): 1"  -- EFI partition
# 
#    create a new partition
#
#   "Command (m for help): n"  -- n for new
#   "Partition number (1-128, default 2): 2"-- accept the default
#   "First sector (411648-large number, default 411648): 411648" -- accept the default
#    the root partition should be at least 50G
#   "Last sector, +/-sectos or +/-size{K,M,G,T,P} (2048-large number, default large): -- accept the default to use the rest of the disk
#   "Command (m for help): t" -- to change type
#   "Partition type (type L to list all types): 1"  -- EFI partition
#
#    write the changes to the disk
# 
#   "Command (m for help): w" -- to write partition table
#
#    format the partitions
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

# mount the roop partition on the /mnt installation directory
mount /dev/sda2 /mnt

# mount the EFI on the boot partition
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

# '> lsblk' -- to check the partitions and mount points


# <<<<<<<<<<<<<<<<<< windows jumps here....
#  6) Install the base system
pacstrap /mnt base linux linux-firmware intel-ucode vim


#  7) create the fstab file
genfstab -U /mnt >> /mnt/etc/fstab

#  8) move into the installation
arch-chroot /mnt
# [root@archiso /]#
 
#   9) create the swapfile 
fallocate -l 2GB /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

echo "/swapfile none swap defaults 0 0" >> /etc/fstab

#   10) set time zone
#   use '# timedateclt list-timezone | grep Fortaleza'
ln -sf /usr/share/zoneinfo/America/Fortaleza /etc/localtime
hwclock -sysohc


#   11) set locale 
# vim  /etc/locale.gen
# uncomment # en_US.UTF-8 UTF-8
# uncomment # pt_BR.UTF-8 UTF-8
cp /etc/locale.gen /etc/locale.gen-old
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "pt_BR.UT F-8 UTF-8" >> /etc/locale.gen

locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=br-abnt2" >> /etc/vconsole

touch /etc/hostmame 
echo "lazybastard" >> /etc/hostname


echo "127.0.0.1    localhost" >> /etc/hosts
echo "::1     localhost" >> /etc/hosts
echo "127.0.1.1    lazybastard.localdomain    lazybastard" >> /etc/hosts


#    12) create root user password
passwd

#    13) install grub boot loader
pacman -S grub efibootmgr networkmanager network-manager-applet wireless_tools \
          wpa_supplicant dialog os-prober ntfs-3g mtools dosfstools base-devel \
          linux-headers bluez bluez-utils cups git  pulseaudio \
          pulseaudio-bluetooth pulseaudio-alsa pulseaudio-equalizer \
          pulseaudio-jack xdg-utils xdg-user-dirs openssh

#    13) config grub 
grub-install --target=x86_64-efi --efi-directory=/boot --booloader-id=GRUB
grub mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable prg.cups.cupsd
systemclt enable sshd

 
#    14) create a new user
# useradd -mG wheel stupid
# passwd stupid
# EDITOR=vim visudo
# uncomment %whell ALL=(ALL) ALL

#    15) finally exit and umount /mnt
exit
umount -a


# reboot your machine and enter as the newly created stupid user 
# you can used 
nmtui
# to enter the wifi

stupid@lazybastard ~$ sudo pacman -S xf86-video-intel 
# stupid@lazybastard ~$ sudo pacman -S xf86-video-amdgpu --- for amd card
# stupid@lazybastard ~$ sudo pacman -S xf86-video-qxl --- for a virtual machine
# stupid@lazybastard ~$ sudo pacman -S nvidia nvidia-utils  --- for nvidia card
stupid@lazybastard ~$ sudo pacman -S xorg
# now install gdm and gnome or whatever you wish ... 

# another usefull tool ...
stupid@lazybastard ~$ git clone  https:aur.archlinux.org/yay.git
stupid@lazybastard ~$ cd yay
stupid@lazybastard ~$ mkpkg -si

# <<<<<<<<<<<<<<<<<<<<<
# on windows install linux reader to see your linux partition
# you can remove linux and expand windows partition if you which
# to remove grub from efi:
#
# powershell
# > diskpart 
# > DISKPART> list VOLUME
# > sel volume 2
# > assign letter=x
# open the x drive delete the grub directories 
# using task manager -> file -> browse -> this computer
# > remove letter=x 
# > exit
yay -S brave-bin dragon-drop lf nerd-fonts-hack  onlyoffice-bin svg2png google-chrome qgis inkscape zathura okular dolfin

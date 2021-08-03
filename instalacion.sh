#!/bin/bash

# Actualizar base de datos y paquetes
sudo pacman -Syy
sudo pacman -Syu --noconfirm

# Instalar xorg, dependencias para dwm y herramientas
sudo pacman -S --noconfirm wget git neovim base-devel linux-headers xdg-user-dirs xdg-utils libx11 libxft libxinerama xorg-server xorg-xinit xorg-xrandr xwallpaper sxiv scrot terminus-font neofetch htop alsa-utils

# Instalar controlador de GPU Intel
# sudo pacman -S --noconfirm xf86-video-intel
# Cargar el módulo i915 en /etc/mkinitcpio.conf y ejecutar: $ mkinitcpio -p linux

# Copiar y construir dwm, st y dmenu
cp -r ~/.dotfiles/.local/src/ ~/.local/src/
cd ~/.local/src/dwm/ && make clean && sudo make install
cd ~/.local/src/st/ && make clean && sudo make install
cd ~/.local/src/dmenu/ && make clean && sudo make install

# Instalar un compositor
git clone https://aur.archlinux.org/picom-ibhagwan-git.git ~/.local/src/picom/
cd ~/.local/src/picom/
makepkg -si --noconfirm

# Instalar una fuente con íconos
mkdir ~/.local/share/fonts/ttf/FiraCode
cd ~/.local/share/fonts/ttf/FiraCode/
wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
fc-cache

# Crear enlaces simbólicos de los archivos de configuración
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.xinitrc ~/.xinitrc
ln -s ~/.dotfiles/.config/picom/picom.conf ~/.config/picom/picom.conf
ln -s ~/.dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua

# Descargar mi configuración de Neovim
git clone https://github.com/MrSniezny/nvim ~/.config/nvim/

# Iniciar xorg
startx

# Hacer ejecutable al script
# chmod +x instalacion.sh 
# ./.dotfiles/instalacion.sh

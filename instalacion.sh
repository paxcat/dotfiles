#!/bin/bash

# Actualizar base de datos y paquetes
sudo pacman -Syy
sudo pacman -Syu --noconfirm

# Instalar xorg, dependencias para dwm y herramientas
sudo pacman -S --noconfirm wget base-devel cmake linux-headers xdg-user-dirs xdg-utils libev libx11 libxft libxinerama xorg-server xorg-xinit xorg-xrandr xsel xwallpaper sxiv scrot terminus-font neofetch alsa-utils mpd mpc ncmpcpp

# Instalar controlador de GPU Intel
sudo pacman -S --noconfirm xf86-video-intel
# Cargar el módulo i915 en /etc/mkinitcpio.conf y ejecutar: $ mkinitcpio -p linux

# Compilar dwm, st y dmenu
cp -r ~/dotfiles/.local/src/ ~/.local/
cd ~/.local/src/dwm/ && make clean && sudo make install
cd ~/.local/src/st/ && make clean && sudo make install
cd ~/.local/src/dmenu/ && make clean && sudo make install

# Instalar compositor picom
git clone https://aur.archlinux.org/picom-ibhagwan-git.git ~/.local/src/picom/
cd ~/.local/src/picom/
makepkg -si

# Instalar fuente para braille
git clone https://aur.archlinux.org/ttf-ubraille.git ~/.local/src/ubraille/
cd ~/.local/src/ubraille/
makepkg -si

# Instalar monitor de sistema gotop
git clone https://aur.archlinux.org/gotop.git ~/.local/src/gotop/
cd ~/.local/src/gotop/
makepkg -si

# Instalar una fuente con íconos
sudo mkdir -p /usr/share/fonts/ttf/FiraCode
cd /usr/share/fonts/ttf/FiraCode/
sudo wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
cd
fc-cache

# Crear enlaces simbólicos de los archivos de configuración
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.xinitrc ~/.xinitrc
mkdir ~/.config/picom
ln -s ~/dotfiles/.config/picom/picom.conf ~/.config/picom/picom.conf

# Descargar mi configuración de Neovim
git clone https://github.com/MrSniezny/nvim ~/.config/nvim/

# Iniciar xorg
startx

# Hacer ejecutable al script
# chmod +x instalacion.sh
# ./dotfiles/instalacion.sh

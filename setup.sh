#
# An install script for setting up Antergos my way, using the base system as starting point
#

# TODO : scriptlets for dotfiles; use stow?
# TODO : setup GRUB defaults and theme

# start off, update all packages
sudo pacman -Syyu
# and install AUR helper and git
sudo pacman -S yay git

# install window manager and supporting utils, also cli based stuff
sudo pacman -S i3-gaps nitrogen termite rofi htop neofetch scrot
yay -S compton-tryone-git
sudo pacman -S mpd ncmpcpp mpc
yay -S polybar

# install display manager and enable
sudo pacman -S lightdm lightdm-webkit2-greeter light-locker
sudo systemctl enable lightdm

# setup lightdm with litarvan webkit theme
mkdir litarvan
tar -xf litarvan.tar.gz -C ./litarvan
sudo mv ./litarvan /usr/share/lightdm-webkit/themes/
sudo cp ./lightdm.conf /etc/lightdm/
sudo cp ./lightdm-webkit2-greeter.conf /etc/lightdm/

# install applications
sudo pacman -S mpv libreoffice-fresh bleachbit firefox nomacs pinta
sudo pacman -S thunar --asdeps thunar-volman thunar-media-tags-plugin thunar-archive-plugin
yay -S visual-studio-code-bin
yay -S skippy-xd-git

# install an archiver
sudo pacman -Rsn file-roller
sudo pacman -S xarchiver unrar zip p7zip

# additional theme stuff
sudo pacman -S gtk-engines gtk-engine-murrine
sudo pacman -S python-pywal

# install supporting stuff for rofi
sudo pacman -S libqalculate
yay -S rofi-greenclip

# font setup
sudo mv ~/nc_fonts/sf-pro /usr/share/fonts/
sudo mv ~/nc_fonts/pragmata-pro /usr/share/fonts/
sudo mv ~/nc_fonts/nerd-fonts /usr/share/fonts/
sudo fc-cache -f -v

# vs code setup
code --install-extension hsnazar.hyper-term-theme
code --install-extension coenraads.bracket-pair-colorizer
code --install-extension oderwat.indent-rainbow
code --install-extension christian-kohler.path-intellisense
code --install-extension aaron-bond.better-comments
code --install-extension pkief.material-icon-theme
code --install-extension wwm.better-align

# theme setup
yay -S flat-remix-gtk
tar -xf tela-grey.tar.gz
sudo mv ./Tela-grey-Dark /usr/share/icons/

# setup zsh and zimfw
sudo pacman -S zsh
chsh -S /bin/zsh
zsh -c ./zimfw-install.sh

# remove audible bell in shell, too irritating
sed 's/^.*set bell-style.*$/set bell-style none/' /etc/inputrc
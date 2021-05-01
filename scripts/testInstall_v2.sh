##note: you'll need the megasync files downloaded to the same directory as the script
##in order for the install to work, same with xampp
pacman_install() {
	#notify of installation
	echo "Installing your programs..."
	#create packages variable
	local packages=''
	#add in any packages to be installed
	packages+=' cmatrix atom snapd openjdk steam-manjaro steam-native '
	#noconfirm skips y/n confirmation
	sudo pacman -Sy --noconfirm $packages
}
enable_snap() {
    echo "Enabling snap..."
    sudo systemctl enable --now snapd.socket
}
snap_install() {
    echo "Installing from snap store..."
    local snap_packages=''
    snap_packages+=' rambox chrome brave spotify '
    sudo snap install $snap_packages
}
#yay binaries must be installed before running this function
#see https://www.tecmint.com/install-yay-aur-helper-in-arch-linux-and-manjaro/
yay_install() {
    echo "Installing from AUR..."
    local yay_packages=' android-studio'
    packages+= ' '
    yay -Sy --noconfirm $yay_packages
}
pip_install() {
    #Woah...
    echo "Installing from pip..."
    local pip_packages=''
    pip_packages+=' git+https://github.com/will8211/unimatrix.git conda'
    sudo pip install $pip_packages
}
megasync_install() {
    sudo pacman -U --noconfirm megasync-x86_64.pkg.tar.xz
	sudo pacman -U --noconfirm dolphin-megasync-x86_64.pkg.tar.xz
}
xampp_install() {
    chmod 755 xampp-linux-*-installer.run
    sudo ./xampp-linux-*-installer.run
}

#function call
pacman_install
enable_snap
yay_install
pip_install
snap_install
megasync_install
xampp_install

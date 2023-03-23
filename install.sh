#!/bin/bash

# Main menu
echo "Please select an option:"
echo "[1] Install VSCodium"
echo "[2] Install GIMP"
echo "[3] Install Apache"
echo "[4] Update System"
read option

case $option in
    1)
        echo "Installing VSCodium..."
        sudo apt install curl dirmngr ca-certificates software-properties-common apt-transport-https -y
        curl -fsSL https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscodium.gpg > /dev/null
        echo deb [signed-by=/usr/share/keyrings/vscodium.gpg] https://download.vscodium.com/debs vscodium main | sudo tee /etc/apt/sources.list.d/vscodium.list
        sudo apt install codium -y
        echo "VSCodium has been installed."
        sudo codium
        ;;
    2)
        echo "Installing GIMP..."
        sudo apt install gimp -y
        echo "GIMP has been installed."
		    sudo gimp
        ;;
    3)
        echo "Installing Apache..."
        sudo apt install apache2 -y
        echo "Apache has been installed."
        ;;
    4)
        echo "Updating system..."
        sudo apt update && sudo apt upgrade -y
        echo "System has been updated."
        ;;
    *)
        echo "Invalid option."
        ;;
esac

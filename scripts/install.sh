#!/bin/bash

# Check if a package is installed
function is_installed {
    dpkg -s $1 &> /dev/null
}

# Main menu
echo "Please select an option:"
echo "[1] Install VSCodium"
echo "[2] Install GIMP"
echo "[3] Install Apache"
echo "[4] Update System"
read option

case $option in
    1)
        # Check if VSCodium is already installed
        if is_installed codium; then
            echo "VSCodium is already installed."
        else
            # Install VSCodium
            echo "Installing VSCodium..."
            wget -qO- https://git.io/vscodium-install | bash
            echo "VSCodium has been installed."
        fi
        ;;
    2)
        # Check if GIMP is already installed
        if is_installed gimp; then
            echo "GIMP is already installed."
        else
            # Install GIMP
            echo "Installing GIMP..."
            sudo apt-get install gimp -y
            echo "GIMP has been installed."
        fi
        ;;
    3)
        # Check if Apache is already installed
        if is_installed apache2; then
            echo "Apache is already installed."
        else
            # Install Apache
            echo "Installing Apache..."
            sudo apt-get install apache2 -y
            echo "Apache has been installed."
        fi
        ;;
    4)
        # Update the system
        echo "Updating system..."
        sudo apt-get update
        sudo apt-get upgrade -y
        echo "System has been updated."
        ;;
    *)
        # Invalid option
        echo "Invalid option."
        ;;
esac

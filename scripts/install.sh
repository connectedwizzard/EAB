#!/bin/bash

# Check if a package is installed
function is_installed {
    dpkg -s $1 &> /dev/null
}

# List of applications and their installation commands
applications=(
    ["VSCodium"]="wget -qO- https://git.io/vscodium-install | bash"
    ["GIMP"]="sudo apt-get install gimp -y"
    ["Apache"]="sudo apt-get install apache2 -y"
    ["VirtualBox"]="sudo apt-get install virtualbox -y"
    ["KeePassXC"]="sudo apt-get install keepassxc -y"
    ["Firefox"]="sudo apt-get install firefox -y"
    ["VLC"]="sudo apt-get install vlc -y"
    ["Thunderbird"]="sudo apt-get install thunderbird -y"
    ["Inkscape"]="sudo apt-get install inkscape -y"
    ["Blender"]="sudo apt-get install blender -y"
    ["Krita"]="sudo apt-get install krita -y"
    ["Git"]="sudo apt-get install git -y"
    ["Wine"]="sudo apt-get install wine-stable -y"
    ["OBS Studio"]="sudo apt-get install obs-studio -y"
    ["Audacity"]="sudo apt-get install audacity -y"
    ["Shotcut"]="sudo apt-get install shotcut -y"
)

# Main menu
echo "Please select an option:"
for i in "${!applications[@]}"; do
    echo "[$((i+1))] Install ${i}"
done
echo "[$((i+2))] Update System"
read option

# Install or update based on user's choice
if ((option >= 1 && option <= ${#applications[@]})); then
    app_name="${!applications[option-1]}"
    app_cmd="${applications[$app_name]}"
    # Check if the application is already installed
    if is_installed $app_name; then
        echo "$app_name is already installed."
    else
        # Install the application
        echo "Installing $app_name..."
        eval "$app_cmd"
        echo "$app_name has been installed."
    fi
elif ((option == ${#applications[@]}+1)); then
    # Update the system
    echo "Updating system..."
    sudo apt-get update
    sudo apt-get upgrade -y
    echo "System has been updated."
else
    # Invalid option
    echo "Invalid option."
fi

#123
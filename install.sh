#!/bin/bash

# List of config folders to symlink
folders=(fastfetch hypr kitty rofi waybar)

for folder in "${folders[@]}"; do
	src="$PWD/$folder"
	dest="$HOME/.config/$folder"
	backup="$HOME/.config/${folder}.bak"

	if [ -e "$dest" ] || [ -L "$dest" ]; then
		echo "Backing up $dest to $backup"
		mv "$dest" "$backup"
	fi
	echo "Symlinking $src to $dest"
	ln -s "$src" "$dest"
done

# Handle ly/config.ini to /etc/ly/config.ini
src_ly="$PWD/ly/config.ini"
dest_ly="/etc/ly/config.ini"
backup_ly="/etc/ly/config.ini.bak"

if [ -e "$dest_ly" ] || [ -L "$dest_ly" ]; then
	echo "Backing up $dest_ly to $backup_ly"
	sudo mv "$dest_ly" "$backup_ly"
fi
echo "Symlinking $src_ly to $dest_ly"
sudo ln -s "$src_ly" "$dest_ly"

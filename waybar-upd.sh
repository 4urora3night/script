#!/bin/bash


SCRIPT_PATH="$(pwd)/waybar-upd.sh"
catppuccin_docklike="$HOME/Documents/GitHub/dotfiles/.config/waybar(copy-contents)/catppuccin-docklike"
catppuccin_docklike_new="$HOME/.config/waybar/themes/catppuccin-docklike"
dotfiles_waybar="$HOME/Documents/GitHub/dotfiles/.config/waybar(copy-contents)/"
SCRIPT_DEST="$HOME/Documents/GitHub/script/"


usage() {
    echo "Usage: $0 [-u] [-h]"
    echo "  -u    Clones both dotfiles and this script"
    echo "  -h    Display this help message"
    exit 1
}
upd_dots () {
    if [ -d "$catppuccin_docklike" ]; then
        echo "Directory exists"
        echo "Starting deleting old dotfiles..."
        sudo rm -rf "$catppuccin_docklike"
        echo "Coping new dotfiles.."
        sudo cp -r "$catppuccin_docklike_new" "$dotfiles_waybar"
    else
        echo "Directory does not exist"
    fi
}
upd_all () {
    upd_dots
    if [ -d "$SCRIPT_DEST" ]; then
        echo "Directory exists"
        echo "Starting deleting old script..."
        sudo rm -rf "$SCRIPT_DEST/waybar-upd.sh"
        echo "Coping new script.."
        sudo cp -r "$SCRIPT_PATH" "$SCRIPT_DEST"
    else
        echo "Directory does not exist"
    fi 
}
if [ $# -eq 0 ]; then
    upd_dots
else
    while getopts "uh" opt; do
        case $opt in
            u) upd_all ;;
            h) usage ;;
            ?) usage ;;
        esac
    done
fi


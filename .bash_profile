#
# See the bash configuration files for Arch Linux:
#     https://wiki.archlinux.org/title/Bash#Configuration_files
#

# Environment Variables
SCREEN_BRIGHTNESS_SCRIPTS_DIR="/etc/system_config_files_linux/screen_brightness"

export EDITOR="nvim"
export LS_COLORS="di=1;34:"

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"

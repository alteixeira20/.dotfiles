#!/bin/bash

# 🎨 Color scheme
BRIGHT_ORANGE='\033[1;38;5;214m'
WHITE='\033[1;37m'
GREY='\033[0;37m'
RESET='\033[0m'

DOTFILES_DIR="$HOME/.dotfiles"
NVIM_DIR="$DOTFILES_DIR/nvim"
CONFIG_NVIM="$HOME/.config/nvim"

echo -e "${BRIGHT_ORANGE}🔧 Setting up your dotfiles...${RESET}"

# Create ~/.dotfiles if it doesn't exist
if [ ! -d "$DOTFILES_DIR" ]; then
	echo -e "${WHITE}📁 Creating dotfiles directory at ${GREY}$DOTFILES_DIR${RESET}"
	mkdir -p "$DOTFILES_DIR"
fi

# 🛠️ Handle Neovim Config Safely
if [ -L "$CONFIG_NVIM" ] && [ "$(readlink "$CONFIG_NVIM")" == "$NVIM_DIR" ]; then
	echo -e "${GREY}✅ ~/.config/nvim is already a symlink to ~/.dotfiles/nvim, skipping...${RESET}"
else
	# Ensure ~/.config exists and is NOT accidentally removed
	if [ ! -d "$HOME/.config" ]; then
		echo -e "${WHITE}📁 Recreating missing ~/.config directory${RESET}"
		mkdir -p "$HOME/.config"
	fi

	# Move ~/.config/nvim only if it's a real directory (not a symlink)
	if [ -d "$CONFIG_NVIM" ] && [ ! -L "$CONFIG_NVIM" ]; then
		echo -e "${WHITE}🔄 Moving ${GREY}~/.config/nvim${WHITE} to ${GREY}~/.dotfiles/nvim${RESET}"
		mv "$CONFIG_NVIM" "$NVIM_DIR"
	fi

	# Create symlink safely
	if [ ! -L "$CONFIG_NVIM" ]; then
		ln -s "$NVIM_DIR" "$CONFIG_NVIM"
		echo -e "${BRIGHT_ORANGE}🔗 Symlink created: ${GREY}~/.config/nvim → ~/.dotfiles/nvim${RESET}"
	fi
fi

# 🛠️ Handle ~/.zshrc Safely
ZSHRC_FILE="$HOME/.zshrc"
DOT_ZSHRC_FILE="$DOTFILES_DIR/zshrc"

if [ -L "$ZSHRC_FILE" ] && [ "$(readlink "$ZSHRC_FILE")" == "$DOT_ZSHRC_FILE" ]; then
	echo -e "${GREY}✅ ~/.zshrc is already a symlink to ~/.dotfiles/zshrc, skipping...${RESET}"
elif [ -f "$ZSHRC_FILE" ]; then
	echo -e "${WHITE}🔄 Moving ${GREY}~/.zshrc${WHITE} to ${GREY}~/.dotfiles/zshrc${RESET}"
	mv "$ZSHRC_FILE" "$DOT_ZSHRC_FILE"
	ln -s "$DOT_ZSHRC_FILE" "$ZSHRC_FILE"
	echo -e "${BRIGHT_ORANGE}🔗 Symlink created: ${GREY}~/.zshrc → ~/.dotfiles/zshrc${RESET}"
else
	echo -e "${GREY}⚠️ No ~/.zshrc found, skipping symlink creation.${RESET}"
fi

echo -e "${BRIGHT_ORANGE}🎉 dotfiles setup complete! 🚀${RESET}"

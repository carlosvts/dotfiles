#!/bin/bash

# --- 1. INSTALAÇÃO DE PACOTES (FEDORA) ---
echo "Instalando dependências..."
sudo dnf install -y sway waybar wofi nwg-dock nwg-drawer kitty \
    swaybg swayidle swaylock neovim git gcc-c++ clang lldb \
    nodejs python3 thunar zathura zathura-pdf-mupdf solaar \
    starship fastfetch jq xdg-desktop-portal-wlr \
    jetbrains-mono-fonts-all

# --- 2. CRIAÇÃO DE DIRETÓRIOS ---
echo "Criando pastas de configuração..."
mkdir -p ~/.config

# --- 3. CRIAÇÃO DE SYMLINKS (O CÉREBRO DO SETUP) ---
echo "Criando links simbólicos..."

# Função para criar o link e remover o arquivo/pasta se ele já existir (para evitar erros)
create_link() {
    rm -rf "$2"
    ln -s "$HOME/dotfiles/$1" "$2"
    echo "Link criado: $2 -> $1"
}

create_link "sway" "$HOME/.config/sway"
create_link "waybar" "$HOME/.config/waybar"
create_link "wofi" "$HOME/.config/wofi"
create_link "nvim" "$HOME/.config/nvim"
create_link "kitty" "$HOME/.config/kitty"
create_link "nwg-dock" "$HOME/.config/nwg-dock"
create_link "zathura" "$HOME/.config/zathura"
create_link "starship.toml" "$HOME/.config/starship.toml"
create_link "zshrc" "$HOME/.zshrc"
create_link "sway/wallpapers" "$HOME/wallpapers"

# --- 4. PERMISSÕES DE SCRIPTS ---
echo "Ajustando permissões..."
chmod +x ~/dotfiles/sway/*.sh 2>/dev/null

echo "Setup concluído! Reinicie o Sway (Super+Shift+C) para aplicar."

#!/bin/bash

# --- 1. INSTALAÇÃO DE PACOTES (FEDORA) ---
sudo dnf install -y \
    sway waybar wofi nwg-dock nwg-bar nwg-drawer kitty \
    swaybg swayidle swaylock neovim git gcc gcc-c++ clang lldb \
    make cmake nodejs python3 thunar zathura zathura-pdf-mupdf solaar \
    starship fastfetch jq xdg-desktop-portal-wlr \
    SDL2-devel SDL2_mixer-devel check-devel \
    brightnessctl pamixer libappindicator-gtk3 \
    jetbrains-mono-fonts-all fontawesome-fonts-all google-noto-emoji-fonts

# --- 2. CRIAÇÃO DE DIRETÓRIOS ---
mkdir -p ~/.config
mkdir -p ~/Pictures

# --- 3. FUNÇÃO DE SYMLINK ROBUSTA ---
create_link() {
    local source="$HOME/dotfiles/$1"
    local target="$2"

    if [ -e "$target" ] || [ -L "$target" ]; then
        rm -rf "$target"
    fi

    ln -snf "$source" "$target"
}

# Interface e Compositores
create_link "sway" "$HOME/.config/sway"
create_link "waybar" "$HOME/.config/waybar"
create_link "wofi" "$HOME/.config/wofi"
create_link "nwg-dock" "$HOME/.config/nwg-dock"
create_link "kitty" "$HOME/.config/kitty"

# Ferramentas e Starship (Catppuccin Ready)
create_link "nvim" "$HOME/.config/nvim"
create_link "zathura" "$HOME/.config/zathura"
create_link "starship.toml" "$HOME/.config/starship.toml"
create_link "zshrc" "$HOME/.zshrc"

# Recursos Visuais
create_link "sway/wallpapers" "$HOME/Pictures/wallpapers"

# --- 4. AJUSTES FINAIS ---
find ~/dotfiles -name "*.sh" -exec chmod +x {} +

if ! command -v starship &> /dev/null; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

echo "Setup concluído com sucesso!"

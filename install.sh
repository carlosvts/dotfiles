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

# --- 3. FUNÇÃO DE SYMLINK ROBUSTA ---
# Essa função garante que se existir um arquivo real ou um link quebrado, 
# ele será substituído pelo link correto do seu dotfiles.
create_link() {
    local source="$HOME/dotfiles/$1"
    local target="$2"

    # Remove o que quer que esteja no destino para evitar conflitos
    if [ -e "$target" ] || [ -L "$target" ]; then
        rm -rf "$target"
    fi

    ln -snf "$source" "$target"
    echo "✅ Link criado: $target -> $source"
}

echo "Criando links simbólicos..."

# Configurações de Interface (Sway/Wayland)
create_link "sway" "$HOME/.config/sway"
create_link "waybar" "$HOME/.config/waybar"
create_link "wofi" "$HOME/.config/wofi"
create_link "nwg-dock" "$HOME/.config/nwg-dock"
create_link "kitty" "$HOME/.config/kitty"

# O CÉREBRO: Neovim (Linkando a pasta inteira para evitar problemas de indentação/mappings)
create_link "nvim" "$HOME/.config/nvim"

# Outros Apps e Shell
create_link "zathura" "$HOME/.config/zathura"
create_link "starship.toml" "$HOME/.config/starship.toml"
create_link "zshrc" "$HOME/.zshrc"

# Recursos (Wallpapers)
# Se você tiver uma pasta 'wallpapers' dentro de 'sway' no seu dotfiles:
create_link "sway/wallpapers" "$HOME/Pictures/wallpapers"

# --- 4. PERMISSÕES E AJUSTES FINAIS ---
echo "Ajustando permissões..."
find ~/dotfiles -name "*.sh" -exec chmod +x {} +

# Instalação do Starship (caso não queira depender só do DNF)
if ! command -v starship &> /dev/null; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

echo "--------------------------------------------------"
echo "Setup concluído com sucesso!"
echo "Verifique se o Neovim carregou os 4 espaços, ESC e plugins."
echo "--------------------------------------------------"

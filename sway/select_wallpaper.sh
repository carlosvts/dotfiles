#!/bin/bash

# Diretório dos wallpapers (usando o seu link simbólico)
WALL_DIR="$HOME/wallpapers"

# Lista os arquivos e abre o Wofi para você selecionar
SELECTED=$(ls $WALL_DIR | wofi --dmenu --prompt "Escolha o Wallpaper")

# Se você selecionou algo, aplica usando o swaymsg
if [ -n "$SELECTED" ]; then
    # O comando 'fill' preenche a tela, 'swaymsg' envia o comando pro Sway em tempo real
    swaymsg "output * bg $WALL_DIR/$SELECTED fill"
    
    # Opcional: Salva a escolha no config para o próximo boot (ver nota abaixo)
    echo "Wallpaper atualizado para $SELECTED"
fi

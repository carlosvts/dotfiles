require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local opt = vim.opt

-- Configurações de Indentação (4 espaços)
opt.tabstop = 4      -- Um caractere TAB visualmente ocupa 4 espaços
opt.shiftwidth = 4   -- Número de espaços para cada nível de indentação (usado por >> e <<)
opt.softtabstop = 4  -- Número de espaços que o Tab insere no modo de inserção
opt.expandtab = true -- Converte Tabs em espaços (importante para manter consistência em C++/Linux)

-- Mostrar uma linha vertical no limite de 80 ou 100 caracteres
opt.colorcolumn = "100"

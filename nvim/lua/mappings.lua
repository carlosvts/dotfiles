require "nvchad.mappings"
-- add yours here
local map = vim.keymap.set

-- map esc to exit terminal mode 
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Atalho alternativo: Se o ESC falhar, o 'jk' vai te salvar
map("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode with jk" })

-- No modo Visual (v minúsculo), move a seleção e mantém ela selecionada (gv)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move seletion down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Resize windows using Alt + Arrow Keys
-- These are set only for Normal mode ("n")
map("n", "<A-Up>", ":resize +2<CR>", { desc = "window resize up" })
map("n", "<A-Down>", ":resize -2<CR>", { desc = "window resize down" })
map("n", "<A-Left>", ":vertical resize -2<CR>", { desc = "window resize left" })
map("n", "<A-Right>", ":vertical resize +2<CR>", { desc = "window resize right" })

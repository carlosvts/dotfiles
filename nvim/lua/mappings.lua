require "nvchad.mappings"
-- add yours here
local map = vim.keymap.set

-- map esc to exit terminal mode 
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Atalho alternativo: Se o ESC falhar, o 'jk' vai te salvar
map("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode with jk" })
--- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

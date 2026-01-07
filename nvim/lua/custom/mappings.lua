local M = {}

M.terminal = {
  t = {
    -- Sair do modo terminal com ESC
    ["<Esc>"] = { [[<C-\><C-n>]], "Sair do modo terminal" },
  },
}

return M

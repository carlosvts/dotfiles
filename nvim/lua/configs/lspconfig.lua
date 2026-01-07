require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- 1. Defina todos os servidores que você usa
local servers = { "html", "cssls", "clangd", "cmake", "lua_ls", "bashls", "rust_analyzer", "dartls" }

-- 2. Método novo do Neovim 0.11 para habilitar os servidores
-- Isso substitui o antigo lspconfig[lsp].setup
vim.lsp.enable(servers)

-- 3. Aplique as configurações do NvChad para cada servidor usando a nova API
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

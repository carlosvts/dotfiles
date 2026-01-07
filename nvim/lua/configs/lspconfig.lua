require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- Lista de servidores para instalar automaticamente
local servers = { "clangd", "cmake" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end-- read :h vim.lsp.config for changing options of lsp servers 

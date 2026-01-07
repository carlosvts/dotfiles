-- Visualizador de Markdown (Abre no navegador em tempo real)
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- LaTeX Simplificado (Vim-Tex é o padrão ouro, mas leve)
  {
    "lervag/vimtex",
    lazy = false, -- Recomendado carregar no início para arquivos .tex
    config = function()
      vim.g.vimtex_view_method = "zathura" -- Ou 'general' se não tiver o zathura
      vim.g.vimtex_quickfix_mode = 0
    end,
  },

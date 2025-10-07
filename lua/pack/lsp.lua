vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
})
-- Enable LSP servers using nightly builtin API
vim.lsp.enable({
  'lua_ls',
  'pyright',
  'clangd',
  'jdtls',
  'rust_analyzer',
  'vtsls',
  'tailwindcss',
})

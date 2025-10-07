vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp',            branch = 'main' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
})

require("blink.cmp").setup({
  fuzzy = { implementation = "lua" },
  keymap = { preset = 'default' },

  appearance = {
    nerd_font_variant = 'mono'
  },

  completion = { documentation = { auto_show = false } },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
})

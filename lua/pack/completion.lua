vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp',    branch = 'main' },
  { src = "https://github.com/nvim-mini/mini.nvim", branch = "main" },
})

require("mini.snippets").setup({})

require("blink.cmp").setup({
  snippets = { preset = "mini_snippets" },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = { implementation = "lua" },
  keymap = { preset = "default" },
  signature = { enabled = true },
  appearance = { nerd_font_variant = "mono" },
  completion = { documentation = { auto_show = true } },
})

vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", branch = "main" },
	{ src = "https://github.com/nvim-mini/mini.nvim", branch = "main" },
})

-- Snippets
require("mini.snippets").setup({})

-- Blink config
require("blink.cmp").setup({
	snippets = { preset = "mini_snippets" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = { implementation = "lua" }, -- switch to "rust" if Rust is installed
	keymap = { preset = "default" },
	signature = { enabled = true },
	appearance = { nerd_font_variant = "mono" },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 200 },
		keyword = { range = "prefix" },
	},
})

-- Export blink LSP capabilities for reuse
local capabilities = require("blink.cmp").get_lsp_capabilities()
return { capabilities = capabilities }

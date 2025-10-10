vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

-- Import blink's capabilities
local blink_caps = require("pack.completion").capabilities

-- Enable builtin LSP with blink capabilities
vim.lsp.enable({
	"lua_ls",
	"pyright",
	"clangd",
	"jdtls",
	"rust_analyzer",
	"vtsls",
	"tailwindcss",
}, { capabilities = blink_caps })

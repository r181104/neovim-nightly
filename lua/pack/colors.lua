vim.pack.add({
	{ src = "https://github.com/olimorris/onedarkpro.nvim" },
})

require("onedarkpro").setup({
	plugins = {
		all = true,
	},
	styles = {
		types = "bold,italic",
		methods = "NONE",
		numbers = "bold",
		strings = "italic",
		comments = "italic",
		keywords = "bold,italic",
		constants = "bold",
		functions = "italic",
		operators = "NONE",
		variables = "bold",
		parameters = "NONE",
		conditionals = "italic",
		virtual_text = "italic",
	},
	highlights = {
		Comment = { italic = true, underline = true, extend = true },
		Directory = { bold = true },
		ErrorMsg = { italic = true, bold = true },
	},
})

vim.cmd("colorscheme onedark_vivid")

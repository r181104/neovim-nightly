vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim", priority = 1000 },
})

require("tokyonight").setup({
	style = "storm",
	styles = {
		keywords = { italic = true, bold = true },
		functions = { italic = true, bold = true },
		variables = { bold = true },
		comments = { italic = true },
		sidebars = "transparent",
		floats = "transparent",
	},
	cache = true,
	plugins = {
		auto = true,
	},
})
vim.cmd([[colorscheme tokyonight]])

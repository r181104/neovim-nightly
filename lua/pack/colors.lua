vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim", priority = 1000 },
})
require("tokyonight").setup({
	style = "night",
	light_style = "dark",
	transparent = true,
	terminal_colors = false,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = { bold = true },
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
})
vim.cmd([[colorscheme tokyonight-night]])

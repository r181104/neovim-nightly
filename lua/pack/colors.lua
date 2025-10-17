vim.pack.add({
	{ src = "https://github.com/nyoom-engineering/oxocarbon.nvim" },
})

vim.opt.background = "dark"
vim.cmd.colorscheme("oxocarbon")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#fcb001", bg = "none", bold = true })

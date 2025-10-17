vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set
local vim = vim
local opts = { noremap = true, silent = true }

-- General
map({ "n", "i", "c", "v", "x" }, "<C-c>", "<Esc>", opts)
map({ "n", "v", "c", "x" }, ";", ":", opts)
map("n", "<leader>cd", vim.cmd.Ex, opts)
map("n", "<leader>so", ":update<CR> :source<CR>", opts)
map("n", "<leader>si", "source ~/.config/nvim/init.lua<CR>", opts)
map("n", "<leader>rr", ":restart<CR>", opts)
map("n", "<leader>w", ":write<CR>", opts)
map("n", "<leader>q", ":quit<CR>", opts)
map("n", "<leader>bc", ":enew<CR>", opts)
map("n", "<leader>bn", ":bn<CR>", opts)
map("n", "<leader>bp", ":bp<CR>", opts)
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
map("n", "<C-c>", "<cmd>nohlsearch<CR>", opts)
map({ "n", "v" }, "<Leader>y", '"+y', opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Prime's remaps
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Conform
map({ "n", "v" }, "<leader>fm", function()
	require("conform").format({
		async = true,
		lsp_fallback = true,
		timeout_ms = 500,
	})
end, { desc = "[F]or[m]at buffer" })
map("v", "<leader>f", function()
	require("conform").format({
		async = true,
		lsp_fallback = true,
		range = {
			["start"] = vim.api.nvim_buf_get_mark(0, "<"),
			["end"] = vim.api.nvim_buf_get_mark(0, ">"),
		},
	})
end, { desc = "[F]ormat selection" })

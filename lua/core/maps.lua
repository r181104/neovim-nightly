vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set
local vim = vim

-- General
map({ "n", "i", "c", "v", "x" }, "<C-c>", "<Esc>")
map("n", ";", ":")
map("n", "<leader>cd", vim.cmd.Ex)
map("n", "<leader>so", ":update<CR> :source<CR>")
map("n", "<leader>si", "source ~/.config/nvim/init.lua<CR>")
map("n", "<leader>rr", ":restart<CR>")
map("n", "<leader>w", ":write<CR>", { desc = "Save file" })
map("n", "<leader>q", ":quit<CR>", { desc = "Quit" })
map("n", "<leader>bc", ":enew<CR>")
map("n", "<leader>bn", ":bn<CR>")
map("n", "<leader>bp", ":bp<CR>")
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<C-c>", "<cmd>nohlsearch<CR>")
map({ "n", "v" }, "<Leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to system clipboard" })

-- Prime's remaps
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
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

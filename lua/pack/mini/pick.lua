-- ===== Pick & Extra =====
local pick = require("mini.pick")
local extra = require("mini.extra")
pick.setup({
	window = {
		width = 0.8,
		height = 0.4,
		border = "rounded",
		winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
		row = 0.3,
		col = 0.2,
	},
	prompt = "➤ ",
})
extra.setup()
local opts = { desc = "Fuzzy finder style mini.pick", noremap = true, silent = true }
vim.keymap.set("n", "<leader>ff", function()
	pick.builtin.files({
		prompt = "Find Files> ",
		previewer = "builtin",
		cwd = vim.loop.cwd(),
		window = { width = 0.7, height = 0.5, border = "rounded" },
	})
end, opts)
vim.keymap.set("n", "<leader>fh", function()
	pick.builtin.grep_live({
		prompt = "Live Grep> ",
		search_cmd = "rg --vimgrep --smart-case",
		cwd = vim.loop.cwd(),
		window = { width = 0.7, height = 0.5, border = "rounded" },
	})
end, opts)
vim.keymap.set("n", "<leader>fb", function()
	pick.builtin.buffers({
		prompt = "Buffers> ",
		previewer = "builtin",
		window = { width = 0.6, height = 0.4, border = "rounded" },
	})
end, opts)
vim.keymap.set("n", "<leader>fp", function()
	pick.builtin.help({
		prompt = "Help> ",
		previewer = "builtin",
		window = { width = 0.6, height = 0.4, border = "rounded" },
	})
end, opts)
vim.cmd([[
highlight MiniPickPrompt guifg=#FF9E64 guibg=#1E1E2E gui=bold
highlight MiniPickItem guifg=#C0CAF5 guibg=#1E1E2E
highlight MiniPickItemSelected guifg=#1E1E2E guibg=#FF9E64 gui=bold
]])

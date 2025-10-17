vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim", branch = "main" },
})

-- ===== Basics =====
require("mini.basics").setup({
	options = {
		basic = true,
		extra_ui = true,
		win_borders = "single",
	},
	mappings = {
		basic = true,
		option_toggle_prefix = "<leader>o",
		windows = true,
		move_with_alt = true,
	},
	autocommands = { basic = true, relnum_in_visual_mode = true },
})

-- ===== Comment =====
require("mini.comment").setup({
	options = {
		ignore_blank_line = true,
	},
	mappings = {
		comment = "gc",
		comment_line = "<leader>c",
		textobject = "gc",
	},
	hooks = {
		pre = nil,
		post = nil,
	},
})

-- ===== Pairs =====
require("mini.pairs").setup({})

-- ===== AI & Operators =====
require("mini.ai").setup({ n_lines = 500, custom_textobjects = nil })
require("mini.operators").setup({ mappings = true })

vim.keymap.set("n", "gx", "<Plug>(mini-operators-exchange)", { desc = "Exchange" })
vim.keymap.set("n", "gs", "<Plug>(mini-operators-sort)", { desc = "Sort" })
vim.keymap.set("n", "gD", "<Plug>(mini-operators-duplicate)", { desc = "Duplicate" })

-- ===== Indents =====
require("mini.indentscope").setup({
	draw = {
		delay = 100,
		animation = function()
			return 0
		end,
	},
	symbol = "┋",
	options = {
		try_as_border = true,
	},
})

-- ===== Buffers =====
require("mini.bufremove").setup()
vim.keymap.set("n", "<leader>bd", function()
	require("mini.bufremove").delete(0, false)
end)
vim.keymap.set("n", "<leader>bD", function()
	require("mini.bufremove").delete(0, true)
end)

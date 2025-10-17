vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})

require("oil").setup({
	default_file_explorer = true,
	columns = {
		"icon",
	},
	buf_options = {
		bufhidden = "hide",
	},
	win_options = {
		signcolumn = "no",
		cursorcolumn = false,
		foldcolumn = "0",
		conceallevel = 3,
		concealcursor = "nvic",
	},
	prompt_save_on_select_new_entry = true,
	cleanup_delay_ms = 2000,
	lsp_file_methods = {
		enabled = true,
		timeout_ms = 1000,
		autosave_changes = false,
	},
	constrain_cursor = "editable",
	watch_for_changes = true,
	keymaps = {
		["?"] = { "actions.show_help", mode = "n" },
		["<CR>"] = { "actions.select" },
		["<C-v>"] = { "actions.select", opts = { vertical = true } },
		["<C-x>"] = { "actions.select", opts = { horizontal = true } },
		["<C-t>"] = { "actions.select", opts = { tab = true } },
		["<C-p>"] = { "actions.preview" },
		["q"] = { "actions.close", mode = "n" },
		["<C-c>"] = { "actions.close", mode = "n" },
		["r"] = { "actions.refresh" },
		["<C-h>"] = { "actions.parent", mode = "n" },
		["<C-l>"] = { "actions.select" },
		["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
		["."] = { "actions.toggle_hidden", mode = "n" },
	},
	use_default_keymaps = false,
	view_options = {
		preview = true,
		show_hidden = true,
		is_hidden_file = function(name)
			return name:match("^%.") ~= nil
		end,
		is_always_hidden = function(name)
			return name == ".git"
		end,
		natural_order = "fast",
		case_insensitive = false,
		sort = {
			{ "type", "asc" },
			{ "name", "asc" },
		},
	},
	float = {
		padding = 2,
		max_width = 0.9,
		max_height = 0.9,
		border = "rounded",
		win_options = { winblend = 0 },
	},
	preview_win = {
		update_on_cursor_moved = true,
		preview_method = "fast_scratch",
		disable_preview = function(filename)
			-- Disable preview for large files (>1MB)
			local stat = vim.uv.fs_stat(filename)
			return stat and stat.size > 1000000
		end,
	},
	confirmation = {
		max_width = 0.9,
		min_width = { 40, 0.4 },
		max_height = 0.9,
		min_height = { 5, 0.1 },
		border = "rounded",
		win_options = { winblend = 0 },
	},
	progress = {
		max_width = 0.9,
		min_width = { 40, 0.4 },
		max_height = { 10, 0.9 },
		min_height = { 5, 0.1 },
		border = "rounded",
		minimized_border = "none",
		win_options = { winblend = 0 },
	},
	ssh = {
		border = "rounded",
	},
	keymaps_help = {
		border = "rounded",
	},
})

local function toggle_oil()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[buf].filetype == "oil" and vim.api.nvim_buf_is_loaded(buf) then
			vim.cmd("bdelete! " .. buf)
			return
		end
	end
	require("oil").open()
end

vim.keymap.set("n", "<leader>E", toggle_oil, {
	noremap = true,
	silent = true,
	desc = "Toggle Oil file explorer",
})

vim.keymap.set("n", "<leader>e", function()
	require("oil").toggle_float()
end, {
	noremap = true,
	silent = true,
	desc = "Toggle Oil in floating window",
})

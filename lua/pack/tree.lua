vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})

require("oil").setup({
	default_file_explorer = true,
	columns = {
		"icon",
	},
	buf_options = {
		buflisted = false,
		bufhidden = "hide",
	},
	win_options = {
		wrap = false,
		signcolumn = "no",
		cursorcolumn = false,
		foldcolumn = "0",
		spell = false,
		list = false,
		conceallevel = 3,
		concealcursor = "nvic",
	},
	delete_to_trash = false,
	skip_confirm_for_simple_edits = false,
	prompt_save_on_select_new_entry = true,
	cleanup_delay_ms = 2000,
	lsp_file_methods = {
		enabled = true,
		timeout_ms = 1000,
		autosave_changes = false,
	},
	constrain_cursor = "editable",
	watch_for_changes = false,
	keymaps = {
		["?"] = { "actions.show_help", mode = "n" },
		["<CR>"] = "actions.select",
		["<C-v>"] = { "actions.select", opts = { vertical = true } },
		["<C-x>"] = { "actions.select", opts = { horizontal = true } },
		["<C-t>"] = { "actions.select", opts = { tab = true } },
		["<C-p>"] = "actions.preview",
		["q"] = { "actions.close", mode = "n" },
		["r"] = "actions.refresh",
		["<C-h>"] = { "actions.parent", mode = "n" }, -- Ctrl+h to go up (parent directory)
		["<C-l>"] = "actions.select", -- Ctrl+l to open
		["_"] = { "actions.open_cwd", mode = "n" },
		["cd"] = { "actions.cd", mode = "n" },
		["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
		["s"] = { "actions.change_sort", mode = "n" },
		["x"] = "actions.open_external",
		["."] = { "actions.toggle_hidden", mode = "n" },
		["d"] = { "actions.toggle_trash", mode = "n" },
	},
	use_default_keymaps = false,
	view_options = {
		show_hidden = false,
		is_hidden_file = function(name)
			return name:match("^%.") ~= nil
		end,
		is_always_hidden = function()
			return false
		end,
		natural_order = "fast",
		case_insensitive = false,
		sort = {
			{ "type", "asc" },
			{ "name", "asc" },
		},
		highlight_filename = function()
			return nil
		end,
	},
	extra_scp_args = {},
	git = {
		add = function()
			return false
		end,
		mv = function()
			return false
		end,
		rm = function()
			return false
		end,
	},
	float = {
		padding = 2,
		max_width = 0,
		max_height = 0,
		border = nil,
		win_options = { winblend = 0 },
		get_win_title = nil,
		preview_split = "auto",
		override = function(conf)
			return conf
		end,
	},
	preview_win = {
		update_on_cursor_moved = true,
		preview_method = "fast_scratch",
		disable_preview = function()
			return false
		end,
		win_options = {},
	},
	confirmation = {
		max_width = 0.9,
		min_width = { 40, 0.4 },
		max_height = 0.9,
		min_height = { 5, 0.1 },
		border = nil,
		win_options = { winblend = 0 },
	},
	progress = {
		max_width = 0.9,
		min_width = { 40, 0.4 },
		max_height = { 10, 0.9 },
		min_height = { 5, 0.1 },
		border = nil,
		minimized_border = "none",
		win_options = { winblend = 0 },
	},
	ssh = {
		border = nil,
	},
	keymaps_help = {
		border = nil,
	},
})

local function toggle_oil()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_get_option(buf, "filetype") == "oil" and vim.api.nvim_buf_is_loaded(buf) then
			vim.cmd("bd! " .. buf)
			return
		end
	end
	vim.cmd("Oil")
end

vim.api.nvim_set_keymap("n", "<leader>e", "", { noremap = true, silent = true, callback = toggle_oil })

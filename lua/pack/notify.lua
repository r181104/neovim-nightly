vim.pack.add({
	{ src = "https://github.com/rcarriga/nvim-notify" },
})

local notify = require("notify")

notify.setup({
	stages = "slide",
	timeout = 3000,
	background_colour = "#1e222a",
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
	level = "INFO",
	max_width = 50,
	top_down = true,
})

vim.notify = notify

vim.keymap.set("n", "<leader>nd", function()
	require("notify").dismiss()
end, { desc = "Dismiss all notifications" })

vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
	local client = vim.lsp.get_client_by_id(ctx.client_id)
	local level = ({
		"ERROR",
		"WARN",
		"INFO",
		"DEBUG",
	})[result.type] or "INFO"

	vim.notify({ result.message }, level, {
		title = "LSP: " .. client.name,
		timeout = 4000,
		on_open = function(win)
			vim.api.nvim_win_set_option(win, "winblend", 20)
		end,
	})
end

vim.notify = function(msg, level, opts)
	opts = opts or {}
	opts.title = opts.title or "Neovim"
	opts.timeout = opts.timeout or 3000
	notify(msg, level, opts)
end

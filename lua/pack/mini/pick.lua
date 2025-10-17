-- ===== Pick & Extra =====
local pick = require("mini.pick")
local extra = require("mini.extra")

pick.setup({
	-- Delays for better responsiveness
	delay = {
		async = 10,
		busy = 50,
	},
	-- Window configuration
	window = {
		config = function()
			local height = math.floor(0.5 * vim.o.lines)
			local width = math.floor(0.80 * vim.o.columns)
			return {
				anchor = "NW",
				height = height,
				width = width,
				row = math.floor(0.5 * (vim.o.lines - height)),
				col = math.floor(0.5 * (vim.o.columns - width)),
				border = "rounded",
			}
		end,
		prompt_prefix = " ",
	},
	-- Better caching for repeated searches
	options = {
		use_cache = true,
	},
})

extra.setup()

-- Keymaps
vim.keymap.set("n", "<leader>ff", function()
	pick.builtin.files({}, { source = { name = "Files" } })
end, { desc = "Find files", noremap = true, silent = true })

vim.keymap.set("n", "<leader>fh", function()
	pick.builtin.grep_live({}, { source = { name = "Live Grep" } })
end, { desc = "Live grep", noremap = true, silent = true })

vim.keymap.set("n", "<leader>fb", function()
	pick.builtin.buffers({}, { source = { name = "Buffers" } })
end, { desc = "Find buffers", noremap = true, silent = true })

vim.keymap.set("n", "<leader>fp", function()
	pick.builtin.help({}, { source = { name = "Help" } })
end, { desc = "Find help", noremap = true, silent = true })

-- Additional useful pickers
vim.keymap.set("n", "<leader>fr", function()
	extra.pickers.oldfiles({}, { source = { name = "Recent Files" } })
end, { desc = "Recent files", noremap = true, silent = true })

vim.keymap.set("n", "<leader>fg", function()
	extra.pickers.git_files({}, { source = { name = "Git Files" } })
end, { desc = "Git files", noremap = true, silent = true })

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.cmd([[
			highlight MiniPickNormal guibg=NONE ctermbg=NONE
			highlight MiniPickBorder guibg=NONE ctermbg=NONE
			highlight MiniPickBorderBusy guibg=NONE ctermbg=NONE
			highlight MiniPickBorderText guibg=NONE ctermbg=NONE
			highlight MiniPickPrompt guibg=NONE ctermbg=NONE
			highlight MiniPickItem guibg=NONE ctermbg=NONE
			highlight MiniPickHeader guibg=NONE ctermbg=NONE
			highlight MiniPickIconDirectory guibg=NONE ctermbg=NONE
			highlight MiniPickIconFile guibg=NONE ctermbg=NONE
			highlight MiniPickMatchCurrent guibg=NONE ctermbg=NONE
			highlight MiniPickMatchMarked guibg=NONE ctermbg=NONE
			highlight MiniPickMatchRanges guibg=NONE ctermbg=NONE
		]])
	end,
})

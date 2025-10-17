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

-- One Dark Pro refined color scheme for mini.pick
vim.cmd([[
  " Main window and border
  highlight MiniPickNormal guifg=#abb2bf guibg=#282c34
  highlight MiniPickBorder guifg=#61afef guibg=#282c34
  highlight MiniPickBorderBusy guifg=#e5c07b guibg=#282c34
  highlight MiniPickBorderText guifg=#61afef guibg=#282c34 gui=bold
  " Prompt area (yellow for visibility)
  highlight MiniPickPrompt guifg=#e5c07b guibg=#282c34 gui=bold
  " Items in the list
  highlight MiniPickItem guifg=#abb2bf guibg=NONE
  highlight MiniPickItemSelected guifg=#282c34 guibg=#61afef gui=bold
  highlight MiniPickItemMarked guifg=#282c34 guibg=#98c379
  " Match highlighting (cyan and purple for different match types)
  highlight MiniPickMatchCurrent guifg=#56b6c2 guibg=NONE gui=bold,underline
  highlight MiniPickMatchMarked guifg=#c678dd guibg=NONE gui=bold
  highlight MiniPickMatchRanges guifg=#e5c07b guibg=NONE gui=bold
  " Header info
  highlight MiniPickHeader guifg=#61afef guibg=#282c34 gui=bold
  highlight MiniPickIconDirectory guifg=#61afef
  highlight MiniPickIconFile guifg=#abb2bf
  " Preview window
  highlight MiniPickPreviewLine guibg=#3e4451
  highlight MiniPickPreviewRegion guibg=#2c323c guifg=#e5c07b
]])

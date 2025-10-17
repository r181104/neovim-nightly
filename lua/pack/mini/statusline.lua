-- ===== Statusline =====
local statusline = require("mini.statusline")

local function lsp_status()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients > 0 then
		local names = {}
		for _, c in ipairs(clients) do
			table.insert(names, c.name)
		end
		return "%#MiniStatuslineLspOn# " .. table.concat(names, ",") .. "%*"
	else
		return "%#MiniStatuslineLspOff# off%*"
	end
end

vim.api.nvim_set_hl(0, "MiniStatuslineLspOn", { fg = "#a6e3a1", bg = "#1e1e2e", bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineLspOff", { fg = "#f38ba8", bg = "#1e1e2e" })

statusline.setup({
	use_icons = true,
	content = {
		active = function()
			local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
			local git = statusline.section_git({ trunc_width = 75 })
			local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
			local filename = statusline.section_filename({ trunc_width = 140 })
			local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
			local location = statusline.section_location({ trunc_width = 75 })

			return statusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics, lsp_status() } },
				"%<",
				{ hl = "MiniStatuslineFilename", strings = { filename } },
				"%=",
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { location } },
			})
		end,
	},
})

-- ===== Extra: Visual Enhancements =====
vim.cmd([[hi MiniIndentscopeSymbol guifg=#89b4fa]])
vim.cmd([[hi MiniPickPrompt guifg=#f5c2e7]])
vim.cmd([[hi MiniStatuslineDevinfo guifg=#89b4fa]])
vim.cmd([[hi MiniStatuslineFilename guifg=#f38ba8]])
vim.cmd([[hi MiniStatuslineFileinfo guifg=#cba6f7]])

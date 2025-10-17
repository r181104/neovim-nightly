local M = {}

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "mycolors"
vim.o.termguicolors = true

-- Convert HSL to Hex RGB
local function hsl_to_hex(h, s, l)
	s = s / 100
	l = l / 100
	local c = (1 - math.abs(2 * l - 1)) * s
	local x = c * (1 - math.abs((h / 60) % 2 - 1))
	local m = l - c / 2
	local r, g, b

	if h < 60 then
		r, g, b = c, x, 0
	elseif h < 120 then
		r, g, b = x, c, 0
	elseif h < 180 then
		r, g, b = 0, c, x
	elseif h < 240 then
		r, g, b = 0, x, c
	elseif h < 300 then
		r, g, b = x, 0, c
	else
		r, g, b = c, 0, x
	end

	local function to_hex(n)
		n = math.floor((n + m) * 255 + 0.5)
		return string.format("%02x", n > 255 and 255 or (n < 0 and 0 or n))
	end

	return "#" .. to_hex(r) .. to_hex(g) .. to_hex(b)
end

-- Define a smoother HSL palette
local hsl_colors = {
	-- Base Colors (dark, muted backgrounds for contrast)
	base00 = { 225, 15, 12 },
	base01 = { 225, 20, 18 },
	base02 = { 225, 30, 28 },
	base03 = { 225, 40, 48 },
	base04 = { 225, 45, 78 },
	base05 = { 225, 35, 88 },
	base06 = { 225, 40, 96 },

	-- UI Colors
	bg = { 225, 50, 7 },
	bg_subtle = { 225, 25, 18 },
	bg_highlight = { 225, 30, 28 },
	fg = { 225, 30, 88 },
	fg_dim = { 225, 20, 70 },
	fg_subtle = { 225, 30, 50 },

	-- Accent Colors (high saturation and varied lightness for pop)
	red = { 350, 100, 65 },
	orange = { 25, 100, 65 },
	yellow = { 55, 100, 70 },
	green = { 150, 100, 65 },
	cyan = { 190, 100, 65 },
	cyan_bright = { 175, 90, 70 },
	blue = { 210, 100, 65 },
	blue_light = { 210, 90, 75 },
	purple = { 280, 90, 70 },
	magenta = { 320, 90, 75 },

	-- Status Colors (same as accents for visibility)
	error = { 350, 100, 65 },
	warning = { 55, 100, 70 },
	info = { 210, 100, 65 },
	hint = { 150, 100, 65 },

	border = { 225, 40, 50 },
	visual = { 225, 30, 28 },
	cursor = { 320, 90, 80 },

	none = "NONE",
}

-- Convert palette from HSL to hex
local colors = {}
for k, v in pairs(hsl_colors) do
	if type(v) == "table" then
		colors[k] = hsl_to_hex(v[1], v[2], v[3])
	else
		colors[k] = v
	end
end

-- Helper function for highlights
local function hi(group, opts)
	local cmd = "highlight " .. group
	if opts.fg then
		cmd = cmd .. " guifg=" .. opts.fg
	end
	if opts.bg then
		cmd = cmd .. " guibg=" .. opts.bg
	end
	if opts.sp then
		cmd = cmd .. " guisp=" .. opts.sp
	end
	if opts.style then
		cmd = cmd .. " gui=" .. opts.style
	end
	if opts.link then
		cmd = "highlight! link " .. group .. " " .. opts.link
	end
	vim.cmd(cmd)
end

-- Base UI
hi("Normal", { fg = colors.fg, bg = colors.bg })
hi("NormalFloat", { fg = colors.fg, bg = colors.bg_subtle })
hi("NormalNC", { fg = colors.fg, bg = colors.bg })
hi("Cursor", { fg = colors.bg, bg = colors.cursor })
hi("CursorLine", { bg = colors.bg_subtle })
hi("CursorLineNr", { fg = colors.yellow, bg = colors.bg_subtle, style = "bold" })
hi("LineNr", { fg = colors.fg_subtle })
hi("SignColumn", { fg = colors.fg_subtle, bg = colors.bg })
hi("FoldColumn", { fg = colors.fg_subtle, bg = colors.bg })
hi("Folded", { fg = colors.fg_dim, bg = colors.bg_subtle, style = "italic" })
hi("ColorColumn", { bg = colors.bg_subtle })
hi("VertSplit", { fg = colors.border })
hi("WinSeparator", { fg = colors.border })
hi("StatusLine", { fg = colors.fg, bg = colors.bg_subtle, style = "bold" })
hi("StatusLineNC", { fg = colors.fg_subtle, bg = colors.bg_subtle })
hi("Pmenu", { fg = colors.fg, bg = colors.bg_subtle })
hi("PmenuSel", { fg = colors.bg, bg = colors.blue, style = "bold" })
hi("PmenuSbar", { bg = colors.bg_highlight })
hi("PmenuThumb", { bg = colors.fg_subtle })
hi("TabLine", { fg = colors.fg_subtle, bg = colors.bg_subtle })
hi("TabLineFill", { bg = colors.bg })
hi("TabLineSel", { fg = colors.fg, bg = colors.bg_highlight, style = "bold" })
hi("Visual", { bg = colors.visual })
hi("VisualNOS", { bg = colors.visual })
hi("Search", { fg = colors.bg, bg = colors.yellow, style = "bold" })
hi("IncSearch", { fg = colors.bg, bg = colors.orange, style = "bold" })
hi("CurSearch", { fg = colors.bg, bg = colors.red, style = "bold" })
hi("MatchParen", { fg = colors.yellow, style = "bold,underline" })
hi("Question", { fg = colors.blue, style = "bold" })
hi("ModeMsg", { fg = colors.green, style = "bold" })
hi("MoreMsg", { fg = colors.green, style = "bold" })
hi("ErrorMsg", { fg = colors.error, style = "bold" })
hi("WarningMsg", { fg = colors.warning, style = "bold" })
hi("Directory", { fg = colors.blue, style = "bold" })
hi("Title", { fg = colors.purple, style = "bold" })
hi("SpecialKey", { fg = colors.fg_subtle, style = "italic" })
hi("NonText", { fg = colors.fg_subtle })
hi("Conceal", { fg = colors.fg_subtle })
hi("EndOfBuffer", { fg = colors.bg })
hi("Whitespace", { fg = colors.bg_highlight })
hi("FloatBorder", { fg = colors.border, bg = colors.bg_subtle })
hi("FloatTitle", { fg = colors.purple, bg = colors.bg_subtle, style = "bold" })

-- Syntax
hi("Comment", { fg = colors.fg_subtle, style = "italic" })
hi("Constant", { fg = colors.orange, style = "bold" })
hi("String", { fg = colors.green, style = "italic" })
hi("Character", { fg = colors.green })
hi("Number", { fg = colors.orange, style = "bold" })
hi("Boolean", { fg = colors.orange, style = "bold,italic" })
hi("Float", { fg = colors.orange, style = "bold" })
hi("Identifier", { fg = colors.fg })
hi("Function", { fg = colors.purple, style = "bold" })
hi("Statement", { fg = colors.magenta, style = "bold" })
hi("Conditional", { fg = colors.magenta, style = "bold,italic" })
hi("Repeat", { fg = colors.magenta, style = "bold,italic" })
hi("Label", { fg = colors.magenta, style = "bold" })
hi("Operator", { fg = colors.cyan, style = "bold" })
hi("Keyword", { fg = colors.red, style = "bold,italic" })
hi("Exception", { fg = colors.red, style = "bold,italic" })
hi("PreProc", { fg = colors.blue, style = "bold" })
hi("Include", { fg = colors.blue, style = "bold,italic" })
hi("Define", { fg = colors.blue, style = "bold" })
hi("Macro", { fg = colors.blue, style = "bold,italic" })
hi("PreCondit", { fg = colors.blue, style = "bold,italic" })
hi("Type", { fg = colors.yellow, style = "bold" })
hi("StorageClass", { fg = colors.yellow, style = "bold,italic" })
hi("Structure", { fg = colors.yellow, style = "bold" })
hi("Typedef", { fg = colors.yellow, style = "bold,italic" })
hi("Special", { fg = colors.cyan_bright, style = "bold" })
hi("SpecialChar", { fg = colors.cyan_bright, style = "bold,italic" })
hi("Tag", { fg = colors.blue, style = "bold" })
hi("Delimiter", { fg = colors.fg_dim })
hi("SpecialComment", { fg = colors.cyan_bright, style = "bold,italic" })
hi("Debug", { fg = colors.red, style = "bold" })
hi("Underlined", { fg = colors.blue, style = "underline" })
hi("Ignore", { fg = colors.fg_subtle })
hi("Error", { fg = colors.error, style = "bold,underline" })
hi("Todo", { fg = colors.bg, bg = colors.yellow, style = "bold,italic" })

-- Treesitter
hi("@variable", { fg = colors.fg })
hi("@variable.builtin", { fg = colors.red, style = "bold,italic" })
hi("@variable.parameter", { fg = colors.fg_dim, style = "italic" })
hi("@variable.member", { fg = colors.cyan })
hi("@constant", { fg = colors.orange, style = "bold" })
hi("@constant.builtin", { fg = colors.orange, style = "bold,italic" })
hi("@constant.macro", { fg = colors.orange, style = "bold,italic" })
hi("@module", { fg = colors.blue, style = "bold" })
hi("@label", { fg = colors.magenta, style = "bold" })
hi("@string", { fg = colors.green, style = "italic" })
hi("@string.escape", { fg = colors.cyan_bright, style = "bold" })
hi("@string.regexp", { fg = colors.cyan_bright, style = "bold,italic" })
hi("@character", { fg = colors.green })
hi("@character.special", { fg = colors.cyan_bright, style = "bold" })
hi("@number", { fg = colors.orange, style = "bold" })
hi("@boolean", { fg = colors.orange, style = "bold,italic" })
hi("@float", { fg = colors.orange, style = "bold" })
hi("@function", { fg = colors.purple, style = "bold" })
hi("@function.builtin", { fg = colors.purple, style = "bold,italic" })
hi("@function.macro", { fg = colors.purple, style = "bold,italic" })
hi("@function.call", { fg = colors.purple })
hi("@method", { fg = colors.purple, style = "bold" })
hi("@method.call", { fg = colors.purple })
hi("@constructor", { fg = colors.yellow, style = "bold" })
hi("@parameter", { fg = colors.fg_dim, style = "italic" })
hi("@keyword", { fg = colors.red, style = "bold,italic" })
hi("@keyword.function", { fg = colors.magenta, style = "bold,italic" })
hi("@keyword.operator", { fg = colors.magenta, style = "bold" })
hi("@keyword.return", { fg = colors.magenta, style = "bold,italic" })
hi("@conditional", { fg = colors.magenta, style = "bold,italic" })
hi("@repeat", { fg = colors.magenta, style = "bold,italic" })
hi("@exception", { fg = colors.red, style = "bold,italic" })
hi("@operator", { fg = colors.cyan, style = "bold" })
hi("@type", { fg = colors.yellow, style = "bold" })
hi("@type.builtin", { fg = colors.yellow, style = "bold,italic" })
hi("@type.qualifier", { fg = colors.yellow, style = "bold,italic" })
hi("@structure", { fg = colors.yellow, style = "bold" })
hi("@include", { fg = colors.blue, style = "bold,italic" })
hi("@property", { fg = colors.cyan })
hi("@field", { fg = colors.cyan })
hi("@attribute", { fg = colors.blue, style = "italic" })
hi("@namespace", { fg = colors.blue, style = "bold" })
hi("@symbol", { fg = colors.cyan_bright, style = "bold" })
hi("@tag", { fg = colors.red, style = "bold" })
hi("@tag.attribute", { fg = colors.cyan, style = "italic" })
hi("@tag.delimiter", { fg = colors.fg_subtle })
hi("@text", { fg = colors.fg })
hi("@text.strong", { style = "bold" })
hi("@text.emphasis", { style = "italic" })
hi("@text.underline", { style = "underline" })
hi("@text.strike", { style = "strikethrough" })
hi("@text.title", { fg = colors.purple, style = "bold" })
hi("@text.literal", { fg = colors.green })
hi("@text.uri", { fg = colors.cyan_bright, style = "underline" })
hi("@text.math", { fg = colors.blue, style = "italic" })
hi("@text.reference", { fg = colors.blue, style = "bold" })
hi("@text.todo", { fg = colors.bg, bg = colors.yellow, style = "bold,italic" })
hi("@text.warning", { fg = colors.bg, bg = colors.warning, style = "bold" })
hi("@text.danger", { fg = colors.bg, bg = colors.error, style = "bold" })
hi("@text.note", { fg = colors.bg, bg = colors.info, style = "bold,italic" })
hi("@comment", { fg = colors.fg_subtle, style = "italic" })
hi("@punctuation", { fg = colors.fg_dim })
hi("@punctuation.delimiter", { fg = colors.fg_dim })
hi("@punctuation.bracket", { fg = colors.fg_dim })
hi("@punctuation.special", { fg = colors.cyan_bright, style = "bold" })

-- LSP
hi("LspReferenceText", { bg = colors.bg_highlight })
hi("LspReferenceRead", { bg = colors.bg_highlight })
hi("LspReferenceWrite", { bg = colors.bg_highlight, style = "bold" })
hi("LspSignatureActiveParameter", { fg = colors.yellow, style = "bold" })
hi("LspCodeLens", { fg = colors.fg_subtle, style = "italic" })
hi("LspInlayHint", { fg = colors.fg_subtle, style = "italic" })

-- Diagnostics
hi("DiagnosticError", { fg = colors.error, style = "bold" })
hi("DiagnosticWarn", { fg = colors.warning, style = "bold" })
hi("DiagnosticInfo", { fg = colors.info })
hi("DiagnosticHint", { fg = colors.hint })
hi("DiagnosticVirtualTextError", { fg = colors.error, style = "italic" })
hi("DiagnosticVirtualTextWarn", { fg = colors.warning, style = "italic" })
hi("DiagnosticVirtualTextInfo", { fg = colors.info, style = "italic" })
hi("DiagnosticVirtualTextHint", { fg = colors.hint, style = "italic" })
hi("DiagnosticUnderlineError", { sp = colors.error, style = "underline" })
hi("DiagnosticUnderlineWarn", { sp = colors.warning, style = "underline" })
hi("DiagnosticUnderlineInfo", { sp = colors.info, style = "underline" })
hi("DiagnosticUnderlineHint", { sp = colors.hint, style = "underline" })
hi("DiagnosticFloatingError", { fg = colors.error, style = "bold" })
hi("DiagnosticFloatingWarn", { fg = colors.warning, style = "bold" })
hi("DiagnosticFloatingInfo", { fg = colors.info })
hi("DiagnosticFloatingHint", { fg = colors.hint })

-- Git/Diff
hi("DiffAdd", { fg = colors.green, bg = colors.bg_subtle })
hi("DiffChange", { fg = colors.yellow, bg = colors.bg_subtle })
hi("DiffDelete", { fg = colors.red, bg = colors.bg_subtle })
hi("DiffText", { fg = colors.blue, bg = colors.bg_highlight, style = "bold" })
hi("diffAdded", { fg = colors.green })
hi("diffRemoved", { fg = colors.red })
hi("diffChanged", { fg = colors.yellow })
hi("diffOldFile", { fg = colors.red, style = "italic" })
hi("diffNewFile", { fg = colors.green, style = "italic" })
hi("diffFile", { fg = colors.blue, style = "bold" })
hi("diffLine", { fg = colors.cyan_bright, style = "bold" })
hi("diffIndexLine", { fg = colors.purple, style = "italic" })

-- GitSigns
hi("GitSignsAdd", { fg = colors.green })
hi("GitSignsChange", { fg = colors.yellow })
hi("GitSignsDelete", { fg = colors.red })
hi("GitSignsAddLn", { fg = colors.green, bg = colors.bg_subtle })
hi("GitSignsChangeLn", { fg = colors.yellow, bg = colors.bg_subtle })
hi("GitSignsDeleteLn", { fg = colors.red, bg = colors.bg_subtle })
hi("GitSignsCurrentLineBlame", { fg = colors.fg_subtle, style = "italic" })

-- blink.cmp
hi("BlinkCmpMenu", { fg = colors.fg, bg = colors.bg_subtle })
hi("BlinkCmpMenuBorder", { fg = colors.border, bg = colors.bg_subtle })
hi("BlinkCmpMenuSelection", { fg = colors.bg, bg = colors.blue, style = "bold" })
hi("BlinkCmpLabel", { fg = colors.fg })
hi("BlinkCmpLabelDeprecated", { fg = colors.fg_subtle, style = "strikethrough" })
hi("BlinkCmpLabelMatch", { fg = colors.blue, style = "bold" })
hi("BlinkCmpLabelDescription", { fg = colors.fg_dim, style = "italic" })
hi("BlinkCmpLabelDetail", { fg = colors.cyan, style = "italic" })
hi("BlinkCmpKind", { fg = colors.purple, style = "bold" })
hi("BlinkCmpKindClass", { fg = colors.yellow, style = "bold" })
hi("BlinkCmpKindColor", { fg = colors.cyan })
hi("BlinkCmpKindConstant", { fg = colors.orange, style = "bold" })
hi("BlinkCmpKindConstructor", { fg = colors.yellow, style = "bold" })
hi("BlinkCmpKindEnum", { fg = colors.yellow, style = "bold" })
hi("BlinkCmpKindEnumMember", { fg = colors.cyan })
hi("BlinkCmpKindEvent", { fg = colors.magenta })
hi("BlinkCmpKindField", { fg = colors.cyan })
hi("BlinkCmpKindFile", { fg = colors.blue })
hi("BlinkCmpKindFolder", { fg = colors.blue, style = "bold" })
hi("BlinkCmpKindFunction", { fg = colors.purple, style = "bold" })
hi("BlinkCmpKindInterface", { fg = colors.cyan, style = "italic" })
hi("BlinkCmpKindKeyword", { fg = colors.red, style = "bold,italic" })
hi("BlinkCmpKindMethod", { fg = colors.purple, style = "bold" })
hi("BlinkCmpKindModule", { fg = colors.blue, style = "bold" })
hi("BlinkCmpKindOperator", { fg = colors.cyan, style = "bold" })
hi("BlinkCmpKindProperty", { fg = colors.cyan })
hi("BlinkCmpKindReference", { fg = colors.blue })
hi("BlinkCmpKindSnippet", { fg = colors.green, style = "italic" })
hi("BlinkCmpKindStruct", { fg = colors.yellow, style = "bold" })
hi("BlinkCmpKindText", { fg = colors.fg })
hi("BlinkCmpKindTypeParameter", { fg = colors.yellow, style = "italic" })
hi("BlinkCmpKindUnit", { fg = colors.orange, style = "bold" })
hi("BlinkCmpKindValue", { fg = colors.orange })
hi("BlinkCmpKindVariable", { fg = colors.fg })
hi("BlinkCmpSource", { fg = colors.fg_subtle, style = "italic" })
hi("BlinkCmpGhostText", { fg = colors.fg_subtle, style = "italic" })
hi("BlinkCmpDoc", { fg = colors.fg, bg = colors.bg_subtle })
hi("BlinkCmpDocBorder", { fg = colors.border, bg = colors.bg_subtle })
hi("BlinkCmpDocCursorLine", { bg = colors.bg_highlight })
hi("BlinkCmpSignatureHelp", { fg = colors.fg, bg = colors.bg_subtle })
hi("BlinkCmpSignatureHelpBorder", { fg = colors.border, bg = colors.bg_subtle })
hi("BlinkCmpSignatureHelpActiveParameter", { fg = colors.yellow, style = "bold" })

-- Neo-tree
hi("NeoTreeNormal", { fg = colors.fg, bg = colors.bg })
hi("NeoTreeNormalNC", { fg = colors.fg, bg = colors.bg })
hi("NeoTreeRootName", { fg = colors.purple, style = "bold" })
hi("NeoTreeFileName", { fg = colors.fg })
hi("NeoTreeFileNameOpened", { fg = colors.fg, style = "bold" })
hi("NeoTreeDirectoryName", { fg = colors.blue, style = "bold" })
hi("NeoTreeDirectoryIcon", { fg = colors.blue })
hi("NeoTreeSymbolicLinkTarget", { fg = colors.cyan_bright, style = "italic" })
hi("NeoTreeGitAdded", { fg = colors.green })
hi("NeoTreeGitDeleted", { fg = colors.red })
hi("NeoTreeGitModified", { fg = colors.yellow })
hi("NeoTreeGitConflict", { fg = colors.orange, style = "bold" })
hi("NeoTreeGitUntracked", { fg = colors.cyan, style = "italic" })
hi("NeoTreeGitIgnored", { fg = colors.fg_subtle, style = "italic" })
hi("NeoTreeIndentMarker", { fg = colors.fg_subtle })
hi("NeoTreeExpander", { fg = colors.fg_subtle })
hi("NeoTreeCursorLine", { bg = colors.bg_highlight })
hi("NeoTreeDimText", { fg = colors.fg_subtle })
hi("NeoTreeFloatBorder", { fg = colors.border, bg = colors.bg_subtle })
hi("NeoTreeFloatTitle", { fg = colors.purple, bg = colors.bg_subtle, style = "bold" })
hi("NeoTreeTitleBar", { fg = colors.bg, bg = colors.purple, style = "bold" })
hi("NeoTreeFileIcon", { fg = colors.fg_dim })
hi("NeoTreeModified", { fg = colors.orange })
hi("NeoTreeDotfile", { fg = colors.fg_subtle })

-- nvim-notify
hi("NotifyERRORBorder", { fg = colors.error })
hi("NotifyWARNBorder", { fg = colors.warning })
hi("NotifyINFOBorder", { fg = colors.info })
hi("NotifyDEBUGBorder", { fg = colors.hint })
hi("NotifyTRACEBorder", { fg = colors.purple })
hi("NotifyERRORIcon", { fg = colors.error, style = "bold" })
hi("NotifyWARNIcon", { fg = colors.warning, style = "bold" })
hi("NotifyINFOIcon", { fg = colors.info, style = "bold" })
hi("NotifyDEBUGIcon", { fg = colors.hint, style = "bold" })
hi("NotifyTRACEIcon", { fg = colors.purple, style = "bold" })
hi("NotifyERRORTitle", { fg = colors.error, style = "bold,italic" })
hi("NotifyWARNTitle", { fg = colors.warning, style = "bold,italic" })
hi("NotifyINFOTitle", { fg = colors.info, style = "bold,italic" })
hi("NotifyDEBUGTitle", { fg = colors.hint, style = "bold,italic" })
hi("NotifyTRACETitle", { fg = colors.purple, style = "bold,italic" })
hi("NotifyBackground", { bg = colors.bg })

-- which-key
hi("WhichKey", { fg = colors.purple, style = "bold" })
hi("WhichKeyGroup", { fg = colors.cyan_bright, style = "bold,italic" })
hi("WhichKeyDesc", { fg = colors.fg })
hi("WhichKeySeparator", { fg = colors.fg_subtle })
hi("WhichKeyFloat", { bg = colors.bg_subtle })
hi("WhichKeyValue", { fg = colors.green, style = "italic" })
hi("WhichKeyBorder", { fg = colors.border })

-- nui.nvim
hi("NuiComponentsTreeNode", { fg = colors.fg })
hi("NuiComponentsTreeNodeFocused", { fg = colors.cyan_bright, style = "bold" })
hi("NuiComponentsTreeNodeOpened", { fg = colors.blue, style = "bold" })
hi("NuiComponentsTreeNodeClosed", { fg = colors.fg_dim })

-- mini.nvim
hi("MiniPickBorder", { fg = colors.border })
hi("MiniPickBorderBusy", { fg = colors.orange, style = "bold" })
hi("MiniPickBorderText", { fg = colors.blue, style = "bold" })
hi("MiniPickIconDirectory", { fg = colors.cyan_bright, style = "bold" })
hi("MiniPickIconFile", { fg = colors.fg_dim })
hi("MiniPickHeader", { fg = colors.purple, style = "bold" })
hi("MiniPickMatchCurrent", { fg = colors.bg, bg = colors.blue, style = "bold" })
hi("MiniPickMatchMarked", { fg = colors.green, style = "bold" })
hi("MiniPickMatchRanges", { fg = colors.yellow, style = "bold" })
hi("MiniPickNormal", { fg = colors.fg, bg = colors.bg })
hi("MiniPickPreviewLine", { bg = colors.base01 })
hi("MiniPickPreviewRegion", { bg = colors.base02, style = "bold" })
hi("MiniPickPrompt", { fg = colors.magenta, style = "bold" })

hi("MiniIndentscopeSymbol", { fg = colors.purple, style = "bold" })

hi("MiniFilesDirectory", { fg = colors.blue, style = "bold" })
hi("MiniFilesFile", { fg = colors.fg })
hi("MiniFilesBorder", { fg = colors.border })
hi("MiniFilesCursorLine", { bg = colors.bg_highlight, style = "bold" })
hi("MiniFilesNormal", { fg = colors.fg, bg = colors.bg })
hi("MiniFilesTitle", { fg = colors.purple, style = "bold" })

hi("MiniStatuslineDevinfo", { fg = colors.fg_dim, bg = colors.bg_subtle })
hi("MiniStatuslineFileinfo", { fg = colors.fg_dim, bg = colors.bg_subtle })
hi("MiniStatuslineFilename", { fg = colors.fg, bg = colors.bg_subtle, style = "bold" })
hi("MiniStatuslineInactive", { fg = colors.fg_subtle, bg = colors.bg_subtle })
hi("MiniStatuslineModeCommand", { fg = colors.bg, bg = colors.yellow, style = "bold" })
hi("MiniStatuslineModeInsert", { fg = colors.bg, bg = colors.green, style = "bold" })
hi("MiniStatuslineModeNormal", { fg = colors.bg, bg = colors.blue, style = "bold" })
hi("MiniStatuslineModeOther", { fg = colors.bg, bg = colors.cyan_bright, style = "bold" })
hi("MiniStatuslineModeReplace", { fg = colors.bg, bg = colors.red, style = "bold" })
hi("MiniStatuslineModeVisual", { fg = colors.bg, bg = colors.purple, style = "bold" })

hi("MiniTablineCurrent", { fg = colors.fg, bg = colors.bg_highlight, style = "bold" })
hi("MiniTablineFill", { bg = colors.bg })
hi("MiniTablineHidden", { fg = colors.fg_dim, bg = colors.bg_subtle })
hi("MiniTablineModifiedCurrent", { fg = colors.yellow, bg = colors.bg_highlight, style = "bold" })
hi("MiniTablineModifiedHidden", { fg = colors.yellow, bg = colors.bg_subtle })
hi("MiniTablineVisible", { fg = colors.fg, bg = colors.bg_subtle, style = "bold" })

hi("MiniIconsAzure", { fg = colors.blue, style = "bold" })
hi("MiniIconsBlue", { fg = colors.blue })
hi("MiniIconsCyan", { fg = colors.cyan_bright })
hi("MiniIconsGreen", { fg = colors.green })
hi("MiniIconsGrey", { fg = colors.fg_subtle })
hi("MiniIconsOrange", { fg = colors.orange })
hi("MiniIconsPurple", { fg = colors.purple })
hi("MiniIconsRed", { fg = colors.red })
hi("MiniIconsYellow", { fg = colors.yellow })

hi("MiniNotifyBorder", { fg = colors.border })
hi("MiniNotifyNormal", { fg = colors.fg, bg = colors.bg_subtle })
hi("MiniNotifyTitle", { fg = colors.purple, style = "bold" })

hi("MiniCursorword", { bg = colors.bg_highlight, style = "bold" })
hi("MiniCursorwordCurrent", { bg = colors.bg_highlight, style = "bold" })

hi("MiniJump", { fg = colors.bg, bg = colors.purple, style = "bold" })
hi("MiniJump2dSpot", { fg = colors.bg, bg = colors.red, style = "bold,underline" })

hi("MiniStarterCurrent", { bg = colors.bg_highlight })
hi("MiniStarterFooter", { fg = colors.cyan_bright, style = "italic" })
hi("MiniStarterHeader", { fg = colors.purple, style = "bold" })
hi("MiniStarterInactive", { fg = colors.fg_subtle, style = "italic" })
hi("MiniStarterItem", { fg = colors.fg })
hi("MiniStarterItemBullet", { fg = colors.cyan_bright, style = "bold" })
hi("MiniStarterSection", { fg = colors.blue, style = "bold" })
hi("MiniStarterQuery", { fg = colors.green, style = "bold" })

hi("MiniTrailspace", { bg = colors.red })
hi("MiniSurround", { bg = colors.orange, fg = colors.bg, style = "bold" })

hi("MiniDiffSignAdd", { fg = colors.green })
hi("MiniDiffSignChange", { fg = colors.yellow })
hi("MiniDiffSignDelete", { fg = colors.red })

hi("MiniHipatternsFixme", { fg = colors.bg, bg = colors.error, style = "bold" })
hi("MiniHipatternsHack", { fg = colors.bg, bg = colors.warning, style = "bold" })
hi("MiniHipatternsNote", { fg = colors.bg, bg = colors.info, style = "bold" })
hi("MiniHipatternsTodo", { fg = colors.bg, bg = colors.hint, style = "bold" })

-- Markdown
hi("markdownHeadingDelimiter", { fg = colors.purple, style = "bold" })
hi("markdownCode", { fg = colors.green, style = "italic" })
hi("markdownCodeBlock", { fg = colors.green })
hi("markdownH1", { fg = colors.purple, style = "bold" })
hi("markdownH2", { fg = colors.blue, style = "bold" })
hi("markdownH3", { fg = colors.cyan_bright, style = "bold" })
hi("markdownLinkText", { fg = colors.blue, style = "underline" })
hi("markdownUrl", { fg = colors.cyan_bright, style = "italic,underline" })
hi("markdownItalic", { style = "italic" })
hi("markdownBold", { style = "bold" })
hi("markdownBoldItalic", { style = "bold,italic" })

vim.g.terminal_color_0 = hsl_to_hex(225, 10, 15)
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.magenta
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = hsl_to_hex(225, 15, 92)
vim.g.terminal_color_8 = hsl_to_hex(225, 15, 40)
vim.g.terminal_color_9 = colors.red
vim.g.terminal_color_10 = colors.green
vim.g.terminal_color_11 = colors.yellow
vim.g.terminal_color_12 = colors.blue
vim.g.terminal_color_13 = colors.magenta
vim.g.terminal_color_14 = colors.cyan
vim.g.terminal_color_15 = hsl_to_hex(225, 15, 98)

return M

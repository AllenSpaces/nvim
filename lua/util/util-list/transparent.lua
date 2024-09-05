local status, transparent = pcall(require, "transparent")
local M = {}

if not status then
	vim.notify("Transparent is not undefined")
	return false
end

function M.Config()
	transparent.setup({
		require("transparent").setup({
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			extra_groups = {
				"NormalFloat",
				"NvimTreeNormal",
			},
			exclude_groups = {},
		}),
	})
end

return M

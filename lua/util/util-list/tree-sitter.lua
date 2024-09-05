local M = {}
local status, ts = pcall(require, "nvim-treesitter.configs")

if not status then
	vim.notify("treesitter is not found ...")
	return false
end

function M.Config()
	require("nvim-treesitter.install").prefer_git = true
	ts.setup({
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<CR>",
				node_incremental = "<CR>",
				node_decremental = "<BS>",
				scope_incremental = "<TAB>",
			},
		},
		indent = {
			enable = true,
		},
		rainbow = {
			enable = true,
			extended_mode = true,
			colors = {
				"#ffd6af",
				"#fff4af",
				"#dcffaf",
				"#baffaf",
				"#afe8ff",
				"#d0afff",
			},
		},
		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = true,
			-- 支持语言
			filetypes = {
				"html",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"jsx",
				"tsx",
				"vue",
				"markdown",
			},
			-- 单标签不触发
			skip_tags = {
				"area",
				"base",
				"br",
				"col",
				"command",
				"embed",
				"hr",
				"img",
				"slot",
				"input",
				"keygen",
				"link",
				"meta",
				"param",
				"source",
				"track",
				"wbr",
				"menuitem",
			},
		},
	})
end

return M

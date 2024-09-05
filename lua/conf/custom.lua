local M = {}

function M.Config()
	local custom = {
		{ type = "global", method = "mapleader", value = " " },
		{ type = "global", method = "loaded_netrw", value = 1 },
		{ type = "global", method = "loaded_netrwPlugin", value = 1 },
		{ type = "global", method = "db_ui_show_help", value = 0 },
		{ type = "global", method = "termguicolors", value = true },
		{ type = "option", method = "mouse", value = "" },
		{ type = "option", method = "relativenumber", value = true },
		{ type = "option", method = "number", value = true },
		{ type = "option", method = "numberwidth", value = 4 },
		{ type = "option", method = "autoindent", value = true },
		{ type = "option", method = "tabstop", value = 2 },
		{ type = "option", method = "shiftwidth", value = 2 },
		{ type = "option", method = "expandtab", value = true },
		{ type = "option", method = "autoindent", value = true },
		{ type = "option", method = "smartindent", value = true },
		{ type = "option", method = "clipboard", value = "unnamedplus" },
		{ type = "option", method = "cursorline", value = true },
		{ type = "option", method = "splitbelow", value = true },
		{ type = "option", method = "splitright", value = true },
		{ type = "option", method = "confirm", value = false },
		{ type = "option", method = "backup", value = false },
		{ type = "option", method = "writebackup", value = false },
		{ type = "option", method = "updatetime", value = 50 },
		{ type = "option", method = "signcolumn", value = "yes" },
		{ type = "option", method = "confirm", value = false },
		{ type = "option", method = "pumheight", value = 10 },
		{ type = "option", method = "pumwidth", value = 10 },
		{ type = "option", method = "autoread", value = true },
		{ type = "option", method = "showmode", value = false },
		{ type = "colors", method = "colorscheme", value = "catppuccin-frappe" },
	}

	for _, item in ipairs(custom) do
		if item.type == "global" then
			vim.g[item.method] = item.value
		elseif item.type == "option" then
			vim.opt[item.method] = item.value
		elseif item.type == "colors" then
			vim.cmd(string.format("%s %s", item.method, item.value))
		end
	end
end

return M

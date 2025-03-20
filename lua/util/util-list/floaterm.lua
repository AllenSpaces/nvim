local status, floaterm = pcall(require, "toggleterm")
local Terminal = require("toggleterm.terminal").Terminal
local M = {}

if not status then
	vim.notify("Floaterm is not Found ...", vim.log.levels.ERROR, { title = "Nvim" })
	return false
end

function _Node()
	local node = Terminal:new({ cmd = "node", hidden = true })
	node:toggle()
end

function _Python()
	local python = Terminal:new({ cmd = "python3", hidden = true })
	python:toggle()
end

function _Lua()
	local lua = Terminal:new({ cmd = "lua", hidden = true })
	lua:toggle()
end

function _Git()
	local git = Terminal:new({ cmd = "lazygit", hidden = true })
	git:toggle()
end

function _Sql()
	local sql_cmd = "mysql -u root -p" .. vim.env.MYSQL_PASS
	local sql = Terminal:new({ cmd = sql_cmd, hidden = true })
	sql:toggle()
end

function M.Config()
	floaterm.setup({
		open_mapping = "<leader>ft",
		size = 20,
		hide_numbers = true,
		direction = "float",
		float_opts = {
			border = "rounded",
			winlend = 0,
		},
		autochdir = true,
		shell = "/bin/zsh",
	})
end

return M

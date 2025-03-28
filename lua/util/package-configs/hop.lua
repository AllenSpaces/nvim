local M = {}

local status, hop = pcall(require, "hop")

if not status then
	M.Config = function()
		vim.notify("hop.nvim is not installed", vim.log.levels.ERROR, { title = "Hop.nvim" })
	end
	return M
end

function M.Config()
	hop.setup({})
end

return M

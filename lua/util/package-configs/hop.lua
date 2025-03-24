local M = {}
local status, hop = pcall(require, "hop")

if not status then
	vim.notify("hop is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	return false
end

function M.Config()
	hop.setup({})
end

return M

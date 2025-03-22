local M = {}
local status, snacks = pcall(require, "snacks")

if not status then
	vim.notify("snacks is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	return false
end

function M.Config()
	snacks.setup({
		image = {},
		indent = {},
	})
end

return M

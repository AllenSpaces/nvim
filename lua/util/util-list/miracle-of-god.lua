local M = {}
local status, miracle = pcall(require, "miracle-of-god")

if not status then
	vim.notify("miracle-of-god is not found ...", vim.log.levels.ERROR, { title = "Nvim" })

	return false
end

function M.Config()
	miracle.setup({})
	vim.cmd([[colorscheme miracle-of-god]])
end

return M

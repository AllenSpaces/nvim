local M = {}
local status, miracle = pcall(require,"miracle-of-god")

if not status then
	vim.notify("miracle-of-god is not found ...")
	return false
end

function M.Config()
  miracle.setup({})
end

return M

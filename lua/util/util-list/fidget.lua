local M = {}
local status, fidget = pcall(require, "fidget")

if not status then
	vim.notify("fidget is not found ...")
	return false
end

function M.Config()
	fidget.setup({
		display = {
			render_limit = 0,
		},
	})
end

return M

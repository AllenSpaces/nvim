local M = {}
local status, commenter = pcall(require, "Comment")

if not status then
	vim.notify("Comment is not found ...")
	return false
end

function M.Config()
	commenter.setup({})
end

return M

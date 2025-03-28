local M = {}
local status, commenter = pcall(require, "Comment")

if not status then
	M.Config = function()
		vim.notify("Comment is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	end
	return false
end

function M.Config()
	commenter.setup({})
end

return M

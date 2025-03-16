local M = {}
local status, miracle = pcall(require, "miracle-of-god")

if not status then
	require("notify")("miracle-of-god is not found ...", "error", { title = "nvim" })

	return false
end

function M.Config()
	miracle.setup({})
end

return M

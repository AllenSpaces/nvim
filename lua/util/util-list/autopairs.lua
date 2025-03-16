local M = {}
local status, atpairs = pcall(require, "nvim-autopairs")

if not status then
	require("notify")("auto-pairs is not found ...", "error", { title = "nvim" })

	return false
end

function M.Config()
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp = require("cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	atpairs.setup()
end

return M

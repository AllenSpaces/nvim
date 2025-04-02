local M = {}
local status, snacks = pcall(require, "snacks")

if not status then
	M.Config = function()
		vim.notify("snacks is not found ...", vim.log.leventels.ERROR, { title = "Nvim" })
	end
	return false
end

function M.Config()
	snacks.setup({
		image = {},
		notifier = {
			level = vim.log.levels.TRACE,
			style = "compact",
			icons = {
				error = "󰬌 ",
				warn = "󰬞 ",
				info = "󰬐 ",
				debug = "󰬋 ",
				trace = "󰬛 ",
			},
		},
	})
end

return M

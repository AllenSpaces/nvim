local M = {}
local status, snacks = pcall(require, "snacks")

if not status then
	vim.notify("snacks is not found ...", vim.log.leventels.ERROR, { title = "Nvim" })
	return false
end

function M.Config()
	snacks.setup({
		image = {},
		notifier = {
			init_notify = false,
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

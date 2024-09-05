local M = {}
local status, noice = pcall(require, "noice")

if not status then
	vim.notify("noice is not found")
	return
end

function M.Config()
	require("notify").setup({
		background_colour = "#000000",
	})

	noice.setup({
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			position = {
				row = 1,
				col = "50%",
			},
			format = {
				cmdline = { icon = " " },
				search_down = { icon = "󰁈 " },
				search_up = { icon = " " },
				filter = { icon = "󰤶 " },
				help = { icon = "󰮥 " },
				input = { icon = "󰡁 " },
				lua = { icon = " " },
			},
		},
		messages = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},
		lsp = {
			progress = {
				enabled = true,
				format = "lsp_progress",
				format_done = "lsp_progress_done",
				view = "cmdline_popup",
			},
			message = {
				enabled = false,
				view = "notify",
			},
		},
		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = true,
			lsp_doc_border = true,
		},
	})
end

return M

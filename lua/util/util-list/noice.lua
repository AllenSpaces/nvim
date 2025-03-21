local M = {}
local status_noice, noice = pcall(require, "noice")
local statis_notify, notify = pcall(require, "notify")

if not status_noice then
	vim.notify("noice is not found", vim.log.levels.ERROR, { title = "Nvim" })
	return false
end

if not statis_notify then
	vim.notify("notify is not found", vim.log.levels.ERROR, { title = "Nvim" })
	return false
end

function M.Config()
	notify.setup({
		background_colour = "#000000",
		stages = "slide",
		timeout = 1000,
		render = "default",
		max_width = "50",
		fps = 120,
		level = 1,
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
				help = { icon = "󱏘 " },
				input = { icon = "󰽉 " },
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
				enabled = false,
				format = "lsp_progress",
				format_done = "lsp_progress_done",
				throttle = 1000 / 30,
				view = "mini",
			},
			message = {
				enabled = true,
				view = "messages",
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

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

	local progress = vim.defaulttable()
	vim.api.nvim_create_autocmd("LspProgress", {
		callback = function(event)
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			local value = event.data.params.value
			if not client or type(value) ~= "table" then
				return
			end
			local p = progress[client.id]

			for i = 1, #p + 1 do
				if i == #p + 1 or p[i].token == event.data.params.token then
					p[i] = {
						token = event.data.params.token,
						msg = ("%3d%% %s%s"):format(
							value.kind == "end" and 100 or value.percentage or 100,
							value.title or "",
							value.message and (" **%s**"):format(value.message) or " "
						),
						done = value.kind == "end",
					}
					break
				end
			end

			local msg = {}
			progress[client.id] = vim.tbl_filter(function(v)
				return table.insert(msg, v.msg) or not v.done
			end, p)

			local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
			vim.notify(table.concat(msg, "\n"), vim.log.levels.INFO, {
				id = "lsp_progress",
				title = client.name,
				opts = function(notif)
					notif.icon = #progress[client.id] == 0 and ""
						or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
				end,
			})
		end,
	})
end

return M

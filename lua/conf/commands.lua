local M = {}

function M.Config()
	local commands = {
		{
			mode = { "InsertLeave", "TextChanged" },
			callback = function()
				vim.fn.execute("silent! write! | Format")
			end,
			enable = true,
		},
		{
			mode = { "VimEnter" },
			callback = function()
				if vim.api.nvim_buf_get_name(0) == "" then
					local ok, _ = pcall(vim.fn.execute, "Telescope find_files")
					if not ok then
						vim.notify("Telescope is not available.", vim.log.levels.WARN, { title = "NvimCommands" })
					end
				end
			end,
			enable = true,
		},
		{
			mode = "LspProgress",
			callback = function(event)
				local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
				vim.notify(vim.lsp.status(), vim.log.levels.INFO, {
					id = "lsp_progress",
					title = vim.lsp.get_client_by_id(event.data.client_id).name,
					opts = function(notif)
						notif.icon = event.data.params.value.kind == "end" and ""
							or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
					end,
				})
			end,
			enable = true,
		},
	}
	for _, cmd in ipairs(commands) do
		if not cmd.enable then
			goto continue
		else
			vim.api.nvim_create_autocmd(cmd.mode, {
				callback = cmd.callback,
			})
		end
		::continue::
	end
end

return M

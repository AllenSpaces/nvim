local M = {}
local progress = vim.defaulttable()

function M.Config()
	local commands = {
		{
			mode = { "InsertLeave", "TextChanged" },
			pattern = { "*" },
			callback = function(_)
				vim.fn.execute("silent! write! | Format")
			end,
			enable = true,
		},
		{
			mode = { "VimEnter" },
			pattern = { "*" },
			callback = function(_)
				vim.notify(vim.api.nvim_buf_get_name(0))
				if vim.api.nvim_buf_get_name(0) == "" then
					local ok, _ = pcall(vim.fn.execute, "Telescope find_files")
					if not ok then
						vim.notify("Telescope is not available.", vim.log.leventels.WARN, { title = "NvimCommands" })
					end
				end
			end,
			enable = true,
		},
	}
	for _, cmd in ipairs(commands) do
		if cmd.enable then
			vim.api.nvim_create_autocmd(cmd.mode, {
				pattern = cmd.pattern or "",
				callback = function(event)
					cmd.callback(event)
				end,
				nested = true,
			})
		end
	end
end

return M

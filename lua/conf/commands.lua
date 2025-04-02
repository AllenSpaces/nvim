local M = {}

function M.Config()
	local commands = {
		{
			mode = { "InsertLeave", "TextChanged" },
			pattern = { "*" },
			callback = function()
				vim.fn.execute("silent! write! | Format")
			end,
			enable = true,
		},
		{
			mode = { "VimEnter" },
			pattern = { "*" },
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
	}
	for _, cmd in ipairs(commands) do
		if not cmd.enable then
			goto continue
		else
			vim.api.nvim_create_autocmd(cmd.mode, {
				pattern = cmd.pattern or "",
				callback = cmd.callback,
				nested = true,
			})
		end
		::continue::
	end
end

return M

local M = {}

local function commandNotify(msg)
	if msg ~= "" then
		vim.notify(msg, vim.log.levels.INFO, { title = "NvimCommands" })
	else
		return false
	end
end

function M.Config()
	local commands = {
		{
			mode = { "InsertLeave", "TextChanged" },
			pattern = { "*" },
			callback = function(next)
				vim.fn.execute("silent! write! | Format")
				next()
			end,
			enable = true,
			msg = "",
		},
		{
			mode = { "VimEnter" },
			pattern = { "*" },
			callback = function(next)
				vim.notify(vim.api.nvim_buf_get_name(0))
				if vim.api.nvim_buf_get_name(0) == "" then
					local ok, _ = pcall(vim.fn.execute, "Telescope find_files")
					if not ok then
						vim.notify("Telescope is not available.", vim.log.levels.WARN, { title = "NvimCommands" })
					end
				end
				next()
			end,
			enable = true,
			msg = "",
		},
	}
	for _, cmd in ipairs(commands) do
		if cmd.enable then
			vim.api.nvim_create_autocmd(cmd.mode, {
				pattern = cmd.pattern,
				callback = function()
					cmd.callback(function()
						commandNotify(cmd.msg)
					end)
				end,
				nested = true,
			})
		end
	end
end

return M

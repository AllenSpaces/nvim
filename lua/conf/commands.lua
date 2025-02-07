local M = {}

function M.Config()
	local commands = {
		{
			mode = { "InsertLeave", "TextChanged" },
			pattern = { "*" },
			command = "silent! write! | Format",
			enable = true,
			msg = "",
		},
	}
	for _, cmd in ipairs(commands) do
		if cmd.enable then
			vim.api.nvim_create_autocmd(cmd.mode, {
				pattern = cmd.pattern,
				callback = function()
					vim.fn.execute(cmd.command)
					vim.notify(cmd.msg)
				end,
				nested = true,
			})
		end
	end
end

return M

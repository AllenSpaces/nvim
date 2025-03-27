local M = {}
local group = vim.api.nvim_create_augroup("CodeCompanionFidgetHooks", {})

function M.Events()
	local events = {
		{
			pattern = "CodeCompanionChatOpened",
			callback = function()
				vim.wo.number = false
				vim.wo.relativenumber = false
				vim.notify("DeepSeek At Your Service", vim.log.levels.INFO, { title = "DeepSeek", icon = "󱢴" })
			end,
			enable = true,
		},
		{
			pattern = "CodeCompanionChatHidden",
			callback = function()
				vim.notify("Tranks For Using DeepSeek Chat", vim.log.levels.INFO, { title = "DeepSeek", icon = "󱢴" })
			end,
			enable = true,
		},
	}

	for _, event in ipairs(events) do
		if event.enable then
			vim.api.nvim_create_autocmd({ "User" }, {
				pattern = event.pattern,
				group = group,
				callback = event.callback,
			})
		end
	end
end

return M

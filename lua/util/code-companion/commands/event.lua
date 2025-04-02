local M = {}
local group = vim.api.nvim_create_augroup("CodeCompanionFidgetHooks", { clear = true })

function M.Events()
	local events = {
		{
			pattern = "CodeCompanionChatOpened",
			callback = function()
				vim.wo.number = false
				vim.wo.relativenumber = false
				vim.notify(
					"DeepSeek At Your Service",
					vim.log.levels.INFO,
					{ id = "welcome", title = "DeepSeek", icon = "󱢴" }
				)
			end,
			enable = true,
		},
		{
			pattern = "CodeCompanionChatHidden",
			callback = function()
				vim.notify(
					"Tranks For Using DeepSeek Chat",
					vim.log.levels.INFO,
					{ id = "welcome", title = "DeepSeek", icon = "󱢴" }
				)
			end,
			enable = true,
		},
		{
			pattern = "CodeCompanionRequestStarted",
			callback = function()
				local spinner = {
					"▁",
					"▂",
					"▃",
					"▄",
					"▅",
					"▆",
					"▇",
					"▆",
					"▅",
					"▄",
					"▃",
					"▂",
					"▁",
				}
				vim.notify("Server Request...", vim.log.levels.INFO, {
					id = "deepseek_progress",
					title = "DeepSeek",
					timeout = false,
					opts = function(notif)
						notif.icon = spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
					end,
				})
			end,
			enable = true,
		},
		{
			pattern = { "CodeCompanionRequestStreaming", "CodeCompanionInlineFinished" },
			callback = function()
				vim.notify("Server Finished", vim.log.levels.INFO, {
					id = "deepseek_progress",
					title = "DeepSeek",
					timeout = true,
					opts = function(notif)
						notif.icon = ""
					end,
				})
			end,
			enable = true,
		},
	}

	for _, event in ipairs(events) do
		if not event.enable then
			goto continue
		else
			vim.api.nvim_create_autocmd({ "User" }, {
				pattern = event.pattern,
				group = group,
				callback = event.callback,
			})
		end
		::continue::
	end
end

return M

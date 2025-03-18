local M = {}
local status, ai = pcall(require, "codecompanion")

if not status then
	vim.notify("codecompanion is not found ...")
	return false
end

function M.Config()
	ai.setup({
		opts = {
			language = "zh",
		},
		display = {
			chat = {
				intro_message = "Welcome to the DeepSeek model",
				icons = {
					pinned_buffer = " ",
					watched_buffer = "👀 ",
				},
				window = {
					layout = "float",
					position = nil,
					border = "rounded",
					title = "DeepSeek Chat",
					height = 0.7,
					width = 0.65,
					relative = "editor",
					full_height = true,

					opts = {
						breakindent = true,
						cursorcolumn = false,
						cursorline = false,
						foldcolumn = "0",
						linebreak = true,
						list = false,
						numberwidth = 2,
						signcolumn = "no",
						spell = false,
						wrap = true,
					},
				},
			},
		},
		adapters = {
			deepseek = function()
				return require("codecompanion.adapters").extend("deepseek", {
					env = {
						api_key = function()
							return os.getenv("DEEPSEEK_API_KEY")
						end,
					},
					schema = {
						model = {
							default = "deepseek-coder",
						},
					},
				})
			end,
			copilot = nil,
		},
		strategies = {
			chat = {
				adapter = "deepseek",
			},
			inline = {
				adapter = "deepseek",
				keymaps = {
					accept_change = {
						modes = { n = "ga" },
						description = "Accept the suggested change",
					},
					reject_change = {
						modes = { n = "gr" },
						description = "Reject the suggested change",
					},
				},
			},
		},
	})

	local group = vim.api.nvim_create_augroup("CodeCompanionFidgetHooks", {})

	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = "CodeCompanionChatOpened",
		group = group,
		callback = function()
			vim.wo.number = false
			vim.notify("DeepSeek At Your Service", vim.log.levels.INFO, { title = "DeepSeek" })
		end,
	})
end

return M

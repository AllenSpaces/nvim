local M = {}
local status, AI = pcall(require, "codecompanion")
local DeepSeekKey = os.getenv("DEEPSEEK_API_KEY")
local prompt = require("code-companion.prompts.system.deepseek-r1").prompt

if not status then
	vim.notify("codecompanion is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	return false
end

function M.Config()
	AI.setup({
		opts = {
			language = "zh",
			system_prompt = prompt,
		},
		display = {
			action_palette = {
				width = 95,
				height = 5,
				prompt = "Actions ",
				provider = "telescope",
				opts = {
					show_default_actions = false,
					show_default_prompt_library = false,
				},
			},
			chat = {
				intro_message = "Welcome to the DeepSeek model",
				icons = {
					pinned_buffer = " ",
					watched_buffer = "󰡭 ",
				},
				start_in_insert_mode = false,
				window = {
					layout = "float",
					position = nil,
					border = "rounded",
					title = "DeepSeek Chat",
					height = 0.7,
					width = 0.7,
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
						signcolumn = "yes",
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
						api_key = DeepSeekKey,
					},
					schema = {
						model = {
							default = "deepseek-reasoner",
						},
					},
				})
			end,
		},
		strategies = {
			chat = {
				adapter = "deepseek",
				roles = {
					user = " Wu Kuohao(Allen)",
					llm = " DeepSeek-R1 Service",
				},
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
		prompt_library = {
			["Explan Code"] = require("code-companion.prompts.action.explan-code").explan_code,
		},
	})

	require("code-companion.commands.event").Commands()
end

return M

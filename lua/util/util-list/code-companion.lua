local M = {}
local status, ai = pcall(require, "codecompanion")
local DeepSeekKey = os.getenv("DEEPSEEK_API_KEY")

if not status then
	vim.notify("codecompanion is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	return false
end

if DeepSeekKey == "" then
	vim.notify("DeepSeekApi key not configured correctly", vim.log.levels.ERROR, { title = "DeepSeek" })
	return false
end

function M.Config()
	ai.setup({
		opts = {
			language = "zh",
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
			copilot = nil,
		},
		strategies = {
			chat = {
				adapter = "deepseek",
				slash_commands = {
					["buffer"] = {
						opts = {
							provider = "telescope",
						},
					},
					["file"] = {
						opts = {
							provider = "telescope",
						},
					},
					["symbols"] = {
						opts = {
							provider = "telescope",
						},
					},
					["workspace"] = {
						opts = {
							provider = "telescope",
						},
					},
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
			["Explan Code"] = {
				strategy = "chat",
				description = "Super version of code explanation, based on DeepSeek",
				opts = {
					is_slash_cmd = false,
					modes = { "v" },
					short_name = "Explan",
					auto_submit = true,
					user_prompt = false,
					stop_context_insertion = true,
					adapter = {
						name = "deepseek-reasoner",
					},
				},
				prompts = {
					{
						role = "system",
						content = [[
              当被要求解释代码时，请遵循以下要求
              1.识别编程语言
              2.描述代码目的，并能准确引用该编程语言的核心概念
              3.解释每个函数或重要的代码块，包括参数和返回值
              4.突出说明使用的任何特定函数或方法及其作用
              5.如果适用，请提供该代码如何融入更大项目的上下文
            ]],
						opts = {
							visible = false,
						},
					},
					{
						role = "user",
						content = function(context)
							local input =
								require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

							return string.format(
								"请解释buffer %d中的这段代码\n\n```%s\n%s\n```",
								context.bufnr,
								context.filetype,
								input
							)
						end,
						opts = {
							contain_code = true,
						},
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

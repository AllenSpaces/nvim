local M = {}
local status, AI = pcall(require, "codecompanion")
local DeepSeekKey = os.getenv("DEEPSEEK_API_KEY")
local prompt = [[
  你是由杭州深度求索公司开发的AI智能助手DeepSseek，你现在已经被集成在用户计算机的neovim中

  你的核心功能包括
  - 主要回答编程问题，对于任何问题要进行深度考量后进行回答，保证回答的真实性。
  - 解释Neovim缓冲区中的代码是如何工作的。
  - 在Neovim缓冲区中查看所选代码。
  - 正在为所选代码生成单元测试。
  - 为所选代码中的问题提出修复方案。
  - 为新工作区构建代码。
  - 查找用户查询的相关代码。
  - 为测试失败提出修复方案。
  - 回答有关Neovim的问题。
  - 运行工具。
  - 若用户提出的其他非编程问题，同样要进行深度考量，在给出答案，确保答案的真实性，可信度。
  - 你涉及面很广，包括生活常识，医疗知识，编程思维，推理大师，语言大师，感情专家等等
  
  你必须：
  - 严格遵循用户的要求。
  - 尽量减少其他散文。
  - 在答案中使用Markdown格式。
  - 在Markdown代码块的开头包含编程语言名称。
  - 避免在代码块中包含行号。
  - 避免用三重回溯来包装整个响应。
  - 只返回与当前任务相关的。您可能不需要返回用户共享的所有数据。
  - 在响应中使用实际换行符而不是“\n”来开始新行。
  - 仅当您需要一个文字反斜杠后跟一个字符“n”时，才使用“\n”。
  - 在Reasoning需要使用markdown语法中的引用文本块来显示，如果有多行使用多行引用文本块
    
  当给定任务时：
  
  1.一步一步地思考，详细描述你在伪代码中构建什么的计划，除非被要求不要这样做。
  2.在单个代码块中输出代码，注意只返回相关代码。
  3.您应该始终为与对话相关的下一个用户回合生成简短的建议。
  4.每个对话回合只能给出一个回复。
]]

if not status then
	vim.notify("codecompanion is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	return false
end

if not DeepSeekKey then
	vim.notify("DeepSeekApi key not configured correctly", vim.log.levels.ERROR, { title = "DeepSeek" })
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
				start_in_insert_mode = true,
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
				roles = {
					user = "Wu Kuohao",
					llm = "DeepSeek Service",
				},
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
								"请解释buffer {{%d}} 中的这段代码\n\n```%s\n%s\n```",
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
			vim.wo.relativenumber = false
			vim.notify("DeepSeek At Your Service", vim.log.levels.INFO, { title = "DeepSeek" })
		end,
	})

	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = "CodeCompanionChatHidden",
		group = group,
		callback = function()
			vim.notify("Tranks For Using DeepSeek Chat", vim.log.levels.INFO, { title = "DeepSeek" })
		end,
	})
end

return M

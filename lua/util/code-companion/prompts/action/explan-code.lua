local M = {}

M.explan_code = {
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
				local input = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

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
}

return M

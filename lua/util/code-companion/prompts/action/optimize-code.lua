local M = {}

M.optimize_code = {
	strategy = "inline",
	description = "Optimize code using DeepSeek",
	opts = {
		is_slash_cmd = false,
		modes = { "v" },
		short_name = "Fix",
		auto_submit = true,
		user_prompt = false,
		stop_context_insertion = true,
		adapter = {
			name = "deepseek-coder",
		},
	},
	prompts = {
		{
			role = "system",
			content = [[
              当被要求修复代码时，请遵循以下要求
              1.识别编程语言
              2.根据代码上下文，进行解析，找出需要优化的地方，并优化
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
					"请优化buffer {{%d}} 中的这段代码\n\n```%s\n%s\n```",
					context.bufnr,
					context.filetype or "",
					input
				)
			end,
		},
	},
}

return M

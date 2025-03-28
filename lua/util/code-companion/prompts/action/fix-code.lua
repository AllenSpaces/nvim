local M = {}

M.fix_code = {
	strategy = "inline",
	description = "Use Deepseek to fix code",
	opts = {
		is_slash_cmd = false,
		modes = { "v" },
		short_name = "Fix",
		auto_submit = true,
		user_prompt = false,
		stop_context_insertion = true,
		adapter = {
			name = "deepseel-coder",
		},
	},
	prompts = {
		{
			role = "system",
			content = [[
              当被要求修复代码时，请遵循以下要求
              1.识别编程语言
              2.根据代码上下文，进行解析，并找出错误语法，并修复
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
					"请修复buffer {{%d}} 中的这段代码\n\n```%s\n%s\n```",
					context.bufnr,
					context.filetype or "",
					input
				)
			end,
		},
	},
}

return M

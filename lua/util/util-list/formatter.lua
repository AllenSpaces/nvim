local status, fmt = pcall(require, "formatter")
local M = {}

if not status then
	require("notify")("formatter is no found ...", "error", { title = "nvim" })

	return false
end

function M.Config()
	fmt.setup({
		logging = false,
		filetype = {
			json = { require("formatter.filetypes.json").prettier },
			javascript = { require("formatter.filetypes.javascript").prettier },
			javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
			typescript = { require("formatter.filetypes.typescript").prettier },
			typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
			html = { require("formatter.filetypes.html").prettier },
			vue = { require("formatter.filetypes.vue").prettier },
			css = { require("formatter.filetypes.css").prettier },
			scss = { require("formatter.filetypes.css").prettier },
			less = { require("formatter.filetypes.css").prettier },
			java = { require("formatter.filetypes.java").clangformat },
			lua = { require("formatter.filetypes.lua").stylua },
			python = { require("formatter.filetypes.python").ruff },
			markdown = { require("formatter.filetypes.markdown").prettier },
			go = { require("formatter.filetypes.go").gofumpt },
			bash = { require("formatter.filetypes.sh").shfmt },
			sh = { require("formatter.filetypes.sh").shfmt },
			sql = { require("formatter.filetypes.sql").sqlfmt },
		},
	})
end

return M

local status, fmt = pcall(require, "formatter")
local M = {}

if not status then
	vim.notify("formatter is no found ...")
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
		},
	})
end

return M

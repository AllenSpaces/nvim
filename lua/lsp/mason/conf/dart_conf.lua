local M = {}
local util = require("lspconfig.util")

function M.DartLSP()
	require("lspconfig").ast_grep.setup({
		cmd = { "ast-grep", "lsp" },
		filetypes = {
			"dart",
		},
		root_dir = util.root_pattern("pubspec.yaml"),
	})
end

return M

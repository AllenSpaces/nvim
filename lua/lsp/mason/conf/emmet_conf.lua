local M = {}

function M.EmmetLSP()
	require("lspconfig").emmet_language_server.setup({
		cmd = { "emmet-language-server", "--stdio" },
		filetypes = {
			"css",
			"eruby",
			"html",
			"htmldjango",
			"javascriptreact",
			"less",
			"pug",
			"sass",
			"scss",
			"typescriptreact",
			"htmlangular",
			"vue",
		},
	})
end

return M

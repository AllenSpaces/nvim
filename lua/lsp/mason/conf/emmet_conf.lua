local M = {}

function M.EmmetLSP()
	require("lspconfig").emmet_ls.setup({
		filetypes = {
			"html",
			"htmldjango",
			"javascriptreact",
			"typescriptreact",
			"vue",
		},
	})
end

return M

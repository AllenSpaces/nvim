local M = {}

function M.ClangdLSP()
	require("lspconfig").clangd.setup({})
end

return M

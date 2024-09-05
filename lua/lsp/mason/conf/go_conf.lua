local M = {}

function M.GoLSP()
	require("lspconfig").gopls.setup({})
end

return M

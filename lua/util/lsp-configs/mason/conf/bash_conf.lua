local M = {}

function M.BashLSP()
	require("lspconfig").bashls.setup({})
end

return M

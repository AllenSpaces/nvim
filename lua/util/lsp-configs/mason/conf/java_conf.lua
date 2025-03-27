local M = {}

function M.JavaLSP()
	require("lspconfig").jdtls.setup({})
end

return M

local M = {}

function M.VueLSP()
	require("lspconfig").volar.setup({})
end

return M

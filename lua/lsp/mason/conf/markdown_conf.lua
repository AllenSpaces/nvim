local M = {}

function M.MarkdownLSP()
	require("lspconfig").grammarly.setup({})
end

return M

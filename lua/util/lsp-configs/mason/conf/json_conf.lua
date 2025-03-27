local M = {}

function M.JsonLSP()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	require("lspconfig").jsonls.setup({
		capabilities = capabilities,
	})
end

return M

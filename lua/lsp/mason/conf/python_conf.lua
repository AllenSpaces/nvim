local M = {}

function M.PythonLSP()
	require("lspconfig").jedi_language_server.setup({})
end

return M

local M = {}

function M.SqlLSP()
	require("lspconfig").sqlls.setup({
		root_dir = require("lspconfig.util").root_pattern("sqllsrc.json"),
	})
end

return M

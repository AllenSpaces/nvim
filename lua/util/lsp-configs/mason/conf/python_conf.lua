local M = {}

function M.PythonLSP()
	require("lspconfig").pylsp.setup({
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						ignore = { "W391", "W503" },
						maxLineLength = 200,
					},
					jedi_completion = {
						eager = true,
					},
					pylint = {
						enabled = false,
					},
				},
			},
		},
	})
end

return M

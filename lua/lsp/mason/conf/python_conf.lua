local M = {}

function M.PythonLSP()
	require("lspconfig").pylsp.setup({
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						ignore = { "W391" },
						maxLineLength = 200,
					},
					jedi_completion = {
						eager = true,
					},
					pylint = {
						enabled = true,
					},
				},
			},
		},
	})
end

return M

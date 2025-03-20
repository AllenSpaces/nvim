local M = {}

function M.VueLSP()
	require("lspconfig").volar.setup({
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		init_options = {
			vue = {
				hybridMode = false,
			},
		},
		settings = {
			volar = {
				templateInterpolationService = {
					enable = true,
				},
				componentReferenceService = {
					enable = true,
				},
			},
		},
	})
end

return M

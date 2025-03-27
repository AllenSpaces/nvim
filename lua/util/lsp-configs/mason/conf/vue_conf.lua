local M = {}

function M.VueLSP()
	require("lspconfig").volar.setup({
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		init_options = {
			vue = {
				hybridMode = false,
			},
			typescript = {
				tsdk = "/Users/wukuohao/.volta/tools/image/packages/typescript/lib/node_modules/typescript/lib",
			},
		},
	})
end

return M

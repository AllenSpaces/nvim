local M = {}

function M.VueLSP()
	require("lspconfig").volar.setup({
		filetypes = { "vue" },
		init_options = {
			vue = {
				hybridMode = true,
				experimental = {
					templateInterpolationService = true,
				},
			},
			typescript = {
				tsdk = os.getenv("HOME") .. "/.volta/tools/image/packages/typescript/lib/node_modules/typescript/lib",
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = os.getenv("HOME")
							.. "/.volta/tools/image/packages/@vue/language-server/node_modules/@vue/typescript-plugin",
					},
				},
			},
			languageFeatures = {
				implementation = true,
				references = true,
				definition = true,
				typeDefinition = true,
				callHierarchy = true,
				hover = true,
				rename = true,
				renameFileRefactoring = true,
				signatureHelp = true,
				codeAction = true,
				workspaceSymbol = true,
				completion = {
					defaultTagNameCase = "kebabCase",
					defaultAttrNameCase = "kebabCase",
					getDocumentNameCasesRequest = false,
					getDocumentSelectionRequest = false,
				},
			},
		},
	})
end

return M

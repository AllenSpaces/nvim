local M = {}

function M.TypeScriptLSP()
	require("lspconfig").ts_ls.setup({
		init_options = {
			preferences = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = os.getenv("HOME")
						.. "/.mason/packages/vue-language-server/node_modules/@vue/language-server",
					languages = { "javascript", "typescript", "vue", "javascriptreact", "typescriptreact" },
				},
			},
		},
		filetypes = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"vue",
		},
	})
end

return M

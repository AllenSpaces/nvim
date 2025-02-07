local M = {}

function M.TypeScriptLSP()
	require("lspconfig").ts_ls.setup({
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = vim.fn.stdpath("data")
						.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
					languages = { "javascript", "typescript", "vue" },
				},
			},
		},
		filetypes = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"vue",
			"javascript.jsx",
			"typescript.tsx",
		},
	})
end

return M

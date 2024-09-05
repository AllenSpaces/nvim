local M = {}

function M.TypeScriptLSP()
	require("lspconfig").tsserver.setup({
		init_options = {
			plugins = {
				-- Windows
				{
					name = "@vue/typescript-plugin",
					location = vim.fn.stdpath("data")
						.. "\\mason\\packages\\vue-language-server\\node_modules\\@vue\\language-server",
					languages = { "vue" },
				},

				-- MacOs
				-- {
				-- 	name = "@vue/typescript-plugin",
				-- 	location = vim.fn.stdpath("data")
				-- 		.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
				-- 	languages = { "vue" },
				-- },
			},
		},
		filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
	})
end

return M

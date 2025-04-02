local M = {}

function M.TypeScriptLSP()
	require("lspconfig").ts_ls.setup({
		init_options = {
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
		root_dir = require("lspconfig.util").root_pattern("package.json"),
	})

	-- require("lspconfig").denols.setup({
	-- 	root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
	-- })
end

return M

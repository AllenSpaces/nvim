local M = {}
local status, _ = pcall(require, "luasnip")

if not status then
	vim.notify("luasnip is not found ...", vim.log.levels.ERROR, { title = "Nvim" })

	return false
end

function M.Config()
	require("lsp.snips.conf.javascript_snip")
	require("lsp.snips.conf.javascriptreact_snip")
	require("lsp.snips.conf.typescript_snip")
	require("lsp.snips.conf.typescriptreact_snip")
	require("lsp.snips.conf.react_snip")
	require("lsp.snips.conf.lua_snip")
	require("lsp.snips.conf.java_snip")
	require("lsp.snips.conf.python_snip")
	require("lsp.snips.conf.html_snip")
end

return M

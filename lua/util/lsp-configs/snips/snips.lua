local M = {}
local status, _ = pcall(require, "luasnip")

if not status then
	M.Config = function()
		vim.notify("luasnip is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	end
	return false
end

function M.Config()
	require("util.lsp-configs.snips.conf.javascript_snip")
	require("util.lsp-configs.snips.conf.javascriptreact_snip")
	require("util.lsp-configs.snips.conf.typescript_snip")
	require("util.lsp-configs.snips.conf.typescriptreact_snip")
	require("util.lsp-configs.snips.conf.react_snip")
	require("util.lsp-configs.snips.conf.lua_snip")
	require("util.lsp-configs.snips.conf.java_snip")
	require("util.lsp-configs.snips.conf.python_snip")
	require("util.lsp-configs.snips.conf.html_snip")
end

return M

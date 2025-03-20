local status, mason = pcall(require, "mason")
local M = {}

if not status then
	vim.notify("mason is not found ...", vim.log.levels.ERROR, { title = "Nvim" })

	return false
end

function M.Config()
	mason.setup({
		ui = {
			border = "rounded",
			width = 0.6,
			height = 0.6,
			icons = {
				package_installed = "󰏓",
				package_pending = "󰏔",
				package_uninstalled = "󱧙",
			},
		},
	})

	require("lsp.mason.conf.lua_conf").LuaLSP()
	require("lsp.mason.conf.json_conf").JsonLSP()
	require("lsp.mason.conf.clangd_conf").ClangdLSP()
	require("lsp.mason.conf.css_conf").CssLSP()
	require("lsp.mason.conf.emmet_conf").EmmetLSP()
	require("lsp.mason.conf.html_conf").HtmlLSP()
	require("lsp.mason.conf.python_conf").PythonLSP()
	require("lsp.mason.conf.typescript_conf").TypeScriptLSP()
	require("lsp.mason.conf.java_conf").JavaLSP()
	require("lsp.mason.conf.go_conf").GoLSP()
	require("lsp.mason.conf.vue_conf").VueLSP()
	require("lsp.mason.conf.bash_conf").BashLSP()
	-- require("lsp.mason.conf.markdown_conf").MarkdownLSP()
end

return M

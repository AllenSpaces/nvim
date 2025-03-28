local status, mason = pcall(require, "mason")
local M = {}

if not status then
	M.Config = function()
		vim.notify("mason is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	end
	return false
end

function M.Config()
	mason.setup({
		install_root_dir = os.getenv("HOME") .. "/.mason/",
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

	require("util.lsp-configs.mason.conf.lua_conf").LuaLSP()
	require("util.lsp-configs.mason.conf.json_conf").JsonLSP()
	require("util.lsp-configs.mason.conf.clangd_conf").ClangdLSP()
	require("util.lsp-configs.mason.conf.css_conf").CssLSP()
	require("util.lsp-configs.mason.conf.emmet_conf").EmmetLSP()
	require("util.lsp-configs.mason.conf.html_conf").HtmlLSP()
	require("util.lsp-configs.mason.conf.python_conf").PythonLSP()
	require("util.lsp-configs.mason.conf.typescript_conf").TypeScriptLSP()
	require("util.lsp-configs.mason.conf.java_conf").JavaLSP()
	require("util.lsp-configs.mason.conf.go_conf").GoLSP()
	require("util.lsp-configs.mason.conf.vue_conf").VueLSP()
	require("util.lsp-configs.mason.conf.bash_conf").BashLSP()
end

return M

local modules = {
	{ moduleName = "conf.commands", enabled = true },
	{ moduleName = "conf.keymaps", enabled = true },
	{ moduleName = "conf.custom", enabled = true },
	{ moduleName = "util.util-installer", enabled = true },
	{ moduleName = "util.util-list.icons", enabled = true },
	{ moduleName = "util.util-list.nvim-tree", enabled = true },
	{ moduleName = "util.util-list.tree-sitter", enabled = true },
	{ moduleName = "util.util-list.telescope", enabled = true },
	{ moduleName = "util.util-list.formatter", enabled = true },
	{ moduleName = "util.util-list.floaterm", enabled = true },
	{ moduleName = "util.util-list.transparent", enabled = true },
	{ moduleName = "util.util-list.noice", enabled = true },
	{ moduleName = "util.util-list.catppuccin", enabled = true },
	{ moduleName = "util.util-list.autopairs", enabled = true },
	{ moduleName = "util.util-list.commenter", enabled = true },
	{ moduleName = "util.util-list.lualine", enabled = true },
	{ moduleName = "lsp.mason.mason", enabled = true },
	{ moduleName = "lsp.lsp", enabled = true },
	{ moduleName = "lsp.snips.snips", enabled = true },
}

for _, util in ipairs(modules) do
	if util.enabled then
		require(util.moduleName).Config()
	end
end

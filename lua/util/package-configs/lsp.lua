local M = {}
local status, cmp = pcall(require, "cmp")
local lsp_configure = require("util.lsp-configs.lsp-configure")

if not status then
	vim.notify("cmp is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	return false
end

function M.Config()
	for type, icon in pairs(require("util.lsp-configs.kinds.kinds").DiagnosticSign) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = lsp_configure.LspWindow,
		mapping = cmp.mapping.preset.insert(lsp_configure.LspMapping),
		sources = cmp.config.sources(lsp_configure.LspSource.default),
		formatting = lsp_configure.LspFormat,
		experimental = {
			ghost_text = true,
		},
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources(lsp_configure.LspSource.cmdline.search),
		formatting = lsp_configure.LspFormat,
		experimental = {
			ghost_text = true,
		},
	})

	cmp.setup.cmdline({ ":" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources(lsp_configure.LspSource.cmdline.comamnd),
		formatting = lsp_configure.LspFormat,
		experimental = {
			ghost_text = true,
		},
	})
end

return M

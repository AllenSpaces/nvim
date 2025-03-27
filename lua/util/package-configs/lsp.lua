local M = {}

function M.Config()
	for type, icon in pairs(require("util.lsp-configs.kinds.kinds").DiagnosticSign) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	require("util.lsp-configs.lsp-setup").Config()
end

return M

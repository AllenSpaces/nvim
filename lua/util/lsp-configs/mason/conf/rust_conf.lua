local M = {}

function M.RustLSP()
	require("lspconfig").rust_analyzer.setup({
		settings = {
			["rust-analyzer"] = {
				check = {
					command = "clippy",
				},
			},
		},
	})
end

return M

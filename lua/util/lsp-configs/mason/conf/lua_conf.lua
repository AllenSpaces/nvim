local M = {}

function M.LuaLSP()
	require("lspconfig").lua_ls.setup({
		on_init = function(client)
			local path = client.workspace_folders[1].name
			for _, filename in ipairs({ "/.luarc.json", "/.luarc.jsonc" }) do
				if vim.uv.fs_stat(path .. filename) then
					return
				end
			end

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					version = "LuaJIT",
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						vim.api.nvim_get_runtime_file("", true),
					},
				},
				diagnostics = {
					globals = { "vim" },
				},
			})
		end,
		settings = {
			Lua = {
				telemetry = {
					enable = false,
				},
			},
		},
	})
end

return M

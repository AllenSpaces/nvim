local M = {}

function M.VueLSP()
	require("lspconfig").volar.setup({
		root_dir = function(path)
			local project_dir = ""
			local current_dir = vim.fn.fnamemodify(path, ":h")
			while true do
				local isexits = vim.fn.findfile("package.json", current_dir)
				if isexits ~= "" then
					project_dir = current_dir
					break
				end
				current_dir = vim.fn.fnamemodify(current_dir, ":h")
			end
			return project_dir
		end,
	})
end

return M

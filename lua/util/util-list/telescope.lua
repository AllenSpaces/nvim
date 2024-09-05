local status, telescope = pcall(require, "telescope")
local M = {}

if not status then
	vim.notify("telescope is not found ...")
	return false
end

function M.Config()
	telescope.setup({
		defaults = {
			history = false,
			path_display = {
				"tail",
			},
			file_ignore_patterns = {
				"node_modules",
				".git",
				".hg",
				".DS_Store",
				"__pycache__",
				"%.log",
			},
			extensions = {
				import = {
					insert_at_top = true,
					custom_languages = {
						{
							regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
							filetypes = { "typescript", "typescriptreact", "javascript", "react", "python" },
							extensions = { "js", "ts" },
						},
					},
				},
			},
			sorting_strategy = "ascending",
		},
	})
end

return M

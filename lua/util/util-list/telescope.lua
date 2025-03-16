local status, telescope = pcall(require, "telescope")
local M = {}

if not status then
	require("notify")("telescope is not found ...", "error", { title = "nvim" })

	return false
end

function M.Config()
	telescope.setup({
		defaults = {
			preview = false,
			layout_config = {
				width = 0.5,
				height = 0.6,
				prompt_position = "top",
			},
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
				project = {},
			},
			sorting_strategy = "ascending",
		},
	})
end

return M

local status, telescope = pcall(require, "telescope")
local M = {}

if not status then
	M.Config = function()
		vim.notify("telescope is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	end
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
				".git",
				".hg",
				".DS_Store",
				"__pycache__",
				"%.log",
			},
			extensions = {
				live_grep_args = {},
				treesitter_info = {},
				node_packages = {},
			},
			sorting_strategy = "ascending",
		},
	})
end

return M

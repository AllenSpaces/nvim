local function getModulePath(moduleName)
	local config_dir = vim.fn.stdpath("config")
	local file_path = vim.fn.globpath(config_dir .. "/lua", "**/" .. moduleName .. ".lua", true)

	if file_path == "" then
		vim.notify("Undefined FileName: " .. moduleName, vim.log.levels.ERROR, { title = "Nvim" })
		return nil
	end

	return file_path:gsub("^" .. config_dir .. "/lua/(.-)%.lua$", function(capture)
		return capture:gsub("/", ".")
	end)
end

getModulePath("tree-sitter")

local modules = {
	{ moduleName = "commands", enabled = true },
	{ moduleName = "keymaps", enabled = true, opts = { lazy = true } },
	{ moduleName = "custom", enabled = true },
	{ moduleName = "file-icons", enabled = true },
	{ moduleName = "nvim-tree", enabled = true },
	{ moduleName = "tree-sitter", enabled = true, opts = { lazy = true } },
	{ moduleName = "transparent", enabled = true, opts = { lazy = true } },
	{ moduleName = "telescope", enabled = true },
	{ moduleName = "noice", enabled = true, opts = { lazy = true } },
	{ moduleName = "formatter", enabled = true, opts = { lazy = true } },
	{ moduleName = "floaterm", enabled = true, opts = { lazy = true } },
	{ moduleName = "autopairs", enabled = true, opts = { lazy = true } },
	{ moduleName = "commenter", enabled = true, opts = { lazy = true } },
	{ moduleName = "lualine", enabled = true },
	{ moduleName = "miracle-of-god", enabled = true },
	{ moduleName = "mason", enabled = true, opts = { lazy = true } },
	{ moduleName = "lsp", enabled = true, opts = { lazy = true } },
	{ moduleName = "snips", enabled = true, opts = { lazy = true } },
	{ moduleName = "super-installer", enabled = true },
	{ moduleName = "render-markdown", enabled = true, opts = { lazy = true } },
	{ moduleName = "snacks", enabled = true },
	{ moduleName = "code-companion", enabled = true, opts = { lazy = true } },
	{ moduleName = "hop", enabled = true, opts = { lazy = true } },
}

for _, util in ipairs(modules) do
	if not util.enabled then
		goto continue
	end

	local module_path = getModulePath(util.moduleName)
	if not module_path then
		goto continue
	end

	local config_fn = function()
		require(module_path).Config()
	end

	if util.opts and util.opts.lazy then
		vim.defer_fn(config_fn, util.opts.delay or 500)
	else
		config_fn()
	end

	::continue::
end

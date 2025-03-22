local function getModulePath(moduleName)
	local config_dir = vim.fn.stdpath("config")
	local file_path = vim.fn.globpath(config_dir .. "/lua", "**/" .. moduleName .. ".lua", true)

	if file_path ~= "" then
		return string.gsub(
			string.gsub(string.gsub(file_path, "^" .. config_dir .. "/lua/", ""), "/", "."),
			"%.lua$",
			""
		)
	else
		vim.notify("Undefined FileName: " .. moduleName, vim.log.levels.ERROR, { title = "Nvim" })
	end
end

local modules = {
	{ moduleName = "commands", enabled = true },
	{ moduleName = "keymaps", enabled = true },
	{ moduleName = "custom", enabled = true },
	{ moduleName = "file-icons", enabled = true },
	{ moduleName = "nvim-tree", enabled = true },
	{ moduleName = "tree-sitter", enabled = true },
	{ moduleName = "transparent", enabled = true },
	{ moduleName = "telescope", enabled = true },
	{ moduleName = "noice", enabled = true },
	{ moduleName = "formatter", enabled = true },
	{ moduleName = "floaterm", enabled = true },
	{ moduleName = "autopairs", enabled = true },
	{ moduleName = "commenter", enabled = true },
	{ moduleName = "lualine", enabled = true },
	{ moduleName = "miracle-of-god", enabled = true },
	{ moduleName = "mason", enabled = true },
	{ moduleName = "lsp", enabled = true },
	{ moduleName = "snips", enabled = true },
	{ moduleName = "super-installer", enabled = true },
	{ moduleName = "code-companion", enabled = true },
	{ moduleName = "render-markdown", enabled = true },
	{ moduleName = "snacks", enabled = true },
}

for _, util in ipairs(modules) do
	vim.opt.runtimepath:append(os.getenv("HOME") .. "/.super/package/*")
	vim.opt.runtimepath:append(os.getenv("HOME") .. "/.super/package/*/after")
	vim.opt.fillchars:append({ eob = " " })
	if util.enabled then
		local status, _ = pcall(require, getModulePath(util.moduleName))
		if not status then
			vim.notify("Failed to load module: " .. util.moduleName, vim.log.levels.ERROR, { title = "VimInit" })
		else
			require(getModulePath(util.moduleName)).Config()
		end
	end
end

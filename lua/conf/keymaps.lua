local M = {}

function M.Config()
	vim.g.mapleader = " "
	local keymap = vim.keymap
	local opt = { noremap = true, silent = true }

	local mappings = {
		{ mode = "i", key = "jk", map = "<ESC>", enabled = true },
		{ mode = "v", key = "v", map = "<ESC>", enabled = true },
		{ mode = "n", key = "<leader>q", map = ":qa<CR>", enabled = true },
		{ mode = "n", key = "<leader>w", map = "<C-W><C-W>", enabled = true },
		{ mode = "n", key = "<leader>ff", map = ":Telescope find_files<CR>", enabled = true },
		{ mode = "n", key = "<leader>fo", map = ":Telescope oldfiles<CR>", enabled = true },
		{ mode = "n", key = "<leader>fs", map = ":Telescope treesitter<CR>", enabled = true },
		{ mode = "n", key = "<leader>fm", map = ":Telescope noice<CR>", enabled = true },
		{ mode = "n", key = "<leader>e", map = ":NvimTreeToggle<CR>", enabled = true },
		{ mode = "n", key = "<leader>nh", map = ":set nohlsearch<CR>", enabled = true },
		{ mode = "n", key = "<leader>ms", map = ":Mason<CR>", enabled = true },
		{ mode = "n", key = "<leader>db", map = ":DBUI<CR>", enabled = true },
		{ mode = "n", key = "<leader>b", map = "<C-o>", enabled = true },
		{
			mode = "n",
			key = "gd",
			map = "<cmd>lua vim.lsp.buf.definition()<CR>",
			enabled = true,
			opt,
		},
		{
			mode = "n",
			key = "gD",
			map = "<cmd>lua vim.lsp.buf.declaration()<CR>",
			enabled = true,
			opt,
		},
		{
			mode = "n",
			key = "gi",
			map = "<cmd>lua vim.lsp.buf.implementation()<CR>",
			enabled = true,
			opt,
		},
		{
			mode = "n",
			key = "gt",
			map = "<cmd>lua vim.lsp.buf.type_definition()<CR>",
			enabled = true,
			opt,
		},
	}

	for _, map in ipairs(mappings) do
		if map.enabled then
			keymap.set(map.mode, map.key, map.map, map.opt or opt)
		end
	end
end

return M

local M = {}

function M.Config()
	vim.g.mapleader = " "
	local keymap = vim.keymap
	local opt = { noremap = true, silent = true }

	local mapConfig = {
		{ mode = "i", key = "jk", leader = false, map = "<ESC>", enabled = true },
		{ mode = "v", key = "v", leader = false, map = "<ESC>", enabled = true },
		{ mode = "n", key = "q", leader = true, map = ":q<CR>", enabled = true },
		{ mode = "n", key = "w", leader = true, map = "<C-W><C-W>", enabled = true },
		{ mode = "n", key = "ff", leader = true, map = ":Telescope find_files<CR>", enabled = true },
		{ mode = "n", key = "fo", leader = true, map = ":Telescope oldfiles<CR>", enabled = true },
		{ mode = "n", key = "fs", leader = true, map = ":Telescope treesitter<CR>", enabled = true },
		{ mode = "n", key = "fm", leader = true, map = ":Telescope noice<CR>", enabled = true },
		{ mode = "n", key = "fl", leader = true, map = ":Telescope live_grep_args<CR>", enabled = true },
		{ mode = "n", key = "fh", leader = true, map = ":Telescope treesitter_info<CR>", enabled = true },
		{ mode = "n", key = "fn", leader = true, map = ":Telescope node_packages<CR>", enabled = true },
		{ mode = "n", key = "lg", leader = true, map = ":lua _Git()<CR>", enabled = true },
		{ mode = "n", key = "lu", leader = true, map = ":lua _Lua()<CR>", enabled = true },
		{ mode = "n", key = "nd", leader = true, map = ":lua _Node()<CR>", enabled = true },
		{ mode = "n", key = "py", leader = true, map = ":lua _Python()<CR>", enabled = true },
		{ mode = "n", key = "sq", leader = true, map = ":lua _Sql()<CR>", enabled = true },
		{ mode = "n", key = "e", leader = true, map = ":NvimTreeToggle<CR>", enabled = true },
		{ mode = "n", key = "nh", leader = true, map = ":set nohlsearch<CR>", enabled = true },
		{ mode = "n", key = "ms", leader = true, map = ":Mason<CR>", enabled = true },
		{ mode = "n", key = "b", leader = true, map = "<C-o>", enabled = true },
		{ mode = "n", key = "cc", leader = true, map = ":CodeCompanionChat Toggle<CR>", enabled = true },
		{ mode = "v", key = "ca", leader = true, map = ":'<,'>CodeCompanionActions<CR>", enabled = true },
		{ mode = "n", key = "ca", leader = true, map = ":CodeCompanionActions<CR>", enabled = true },
		{ mode = "n", key = "hw", leader = true, map = ":HopWord<CR>", enabled = true },
		{ mode = "n", key = "hl", leader = true, map = ":HopLine<CR>", enabled = true },
		{
			mode = "n",
			key = "gd",
			leader = false,
			map = function()
				require("telescope.builtin").lsp_definitions()
			end,
			enabled = true,
			desc = "Lsp Rumps Ro Defintions",
		},
		{
			mode = "n",
			key = "gr",
			leader = false,
			map = function()
				require("telescope.builtin").lsp_references()
			end,
			enabled = true,
			desc = "Lsp Rumps Ro References",
		},
		{
			mode = "n",
			key = "gi",
			leader = false,
			map = function()
				require("telescope.builtin").lsp_type_definitions()
			end,
			enabled = true,
			desc = "Lsp Rumps Ro Type Defintions",
		},
		{
			mode = "n",
			key = "rn",
			leader = true,
			map = "<cmd>lua vim.lsp.buf.rename()<CR>",
			enabled = true,
			desc = "Cross File Renaming",
		},
		{
			mode = "n",
			key = "ld",
			leader = true,
			map = function()
				vim.diagnostic.open_float({ source = true, border = "rounded" })
			end,
			enabled = true,
			desc = "Open Error Diagnosis Details",
		},
	}

	for _, map in ipairs(mapConfig) do
		if map.enabled then
			if map.desc then
				opt.desc = map.desc
			end
			keymap.set(map.mode, map.leader and "<leader>" .. map.key or map.key, map.map, map.opt or opt)
		end
	end
end

return M

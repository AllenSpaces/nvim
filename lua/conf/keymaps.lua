local M = {}

function M.Config()
	vim.g.mapleader = " "
	local keymap = vim.keymap
	local opt = { noremap = true, silent = true }

	local mappings = {
		{ mode = "i", key = "jk", map = "<ESC>", enabled = true },
		{ mode = "v", key = "v", map = "<ESC>", enabled = true },
		{ mode = "n", key = "<leader>q", map = ":q<CR>", enabled = true },
		{ mode = "n", key = "<leader>w", map = "<C-W><C-W>", enabled = true },
		{ mode = "n", key = "<leader>ff", map = ":Telescope find_files<CR>", enabled = true },
		{ mode = "n", key = "<leader>fo", map = ":Telescope oldfiles<CR>", enabled = true },
		{ mode = "n", key = "<leader>fs", map = ":Telescope treesitter<CR>", enabled = true },
		{ mode = "n", key = "<leader>fm", map = ":Telescope noice<CR>", enabled = true },
		{ mode = "n", key = "<leader>fp", map = ":Telescope project<CR>", enabled = true },
		{ mode = "n", key = "<leader>fl", map = ":Telescope live_grep_args<CR>", enabled = true },
		{ mode = "n", key = "<leader>fh", map = ":Telescope treesitter_info<CR>", enabled = true },
		{ mode = "n", key = "<leader>fn", map = ":Telescope node_packages<CR>", enabled = true },
		{ mode = "n", key = "<leader>lg", map = ":lua _Git()<CR>", enabled = true },
		{ mode = "n", key = "<leader>lu", map = ":lua _Lua()<CR>", enabled = true },
		{ mode = "n", key = "<leader>nd", map = ":lua _Node()<CR>", enabled = true },
		{ mode = "n", key = "<leader>py", map = ":lua _Python()<CR>", enabled = true },
		{ mode = "n", key = "<leader>sq", map = ":lua _Sql()<CR>", enabled = true },
		{ mode = "n", key = "<leader>e", map = ":NvimTreeToggle<CR>", enabled = true },
		{ mode = "n", key = "<leader>nh", map = ":set nohlsearch<CR>", enabled = true },
		{ mode = "n", key = "<leader>ms", map = ":Mason<CR>", enabled = true },
		{ mode = "n", key = "<leader>b", map = "<C-o>", enabled = true },
		{ mode = "n", key = "<leader>ct", map = ":CodeCompanionChat Toggle<CR>", enabled = true },
		{ mode = "v", key = "<leader>cc", map = ":'<,'>CodeCompanion<CR>", enabled = true },
		{ mode = "n", key = "<leader>cc", map = ":CodeCompanion<CR>", enabled = true },
		{ mode = "v", key = "<leader>ca", map = ":'<,'>CodeCompanionActions<CR>", enabled = true },
		{ mode = "n", key = "<leader>ca", map = ":CodeCompanionActions<CR>", enabled = true },
		{
			mode = "n",
			key = "gd",
			map = function()
				require("telescope.builtin").lsp_definitions()
			end,
			enabled = true,
			desc = "Lsp Rumps Ro Defintions",
		},
		{
			mode = "n",
			key = "gg",
			map = function()
				require("telescope.builtin").lsp_references()
			end,
			enabled = true,
			desc = "Lsp Rumps Ro References",
		},
		{
			mode = "n",
			key = "gi",
			map = function()
				require("telescope.builtin").lsp_type_definitions()
			end,
			enabled = true,
			desc = "Lsp Rumps Ro Type Defintions",
		},
		{
			mode = "n",
			key = "<leader>rn",
			map = "<cmd>lua vim.lsp.buf.rename()<CR>",
			enabled = true,
			desc = "Cross File Renaming",
		},
		{
			mode = "n",
			key = "ld",
			map = function()
				vim.diagnostic.open_float({ source = true, border = "rounded" })
			end,
			enabled = true,
			desc = "Open Error Diagnosis Details",
		},
	}

	for _, map in ipairs(mappings) do
		if map.enabled then
			if map.desc then
				opt.desc = map.desc
			end
			keymap.set(map.mode, map.key, map.map, map.opt or opt)
		end
	end
end

return M

local M = {}

function M.Config()
	vim.g.mapleader = " "
	local keymap = vim.keymap
	local opt = { noremap = true, silent = true }

	-- Group related keymaps together for better organization
	local mapConfig = {
		-- Basic navigation
		{ mode = "n", key = "w", leader = true, map = "<C-W><C-W>", enabled = true, desc = "Switch windows" },
		{ mode = "n", key = "b", leader = true, map = "<C-o>", enabled = true, desc = "Go back" },

		-- File operations
		{ mode = "n", key = "q", leader = true, map = ":q<CR>", enabled = true, desc = "Quit" },
		{ mode = "n", key = "<S-q>", leader = true, map = ":q!<CR>", enabled = true, desc = "Force quit" },
		{
			mode = "n",
			key = "e",
			leader = true,
			map = ":NvimTreeToggle<CR>",
			enabled = true,
			desc = "Toggle file explorer",
		},

		-- Telescope finders
		{
			mode = "n",
			key = "ff",
			leader = true,
			map = ":Telescope find_files<CR>",
			enabled = true,
			desc = "Find files",
		},
		{
			mode = "n",
			key = "fo",
			leader = true,
			map = ":Telescope oldfiles<CR>",
			enabled = true,
			desc = "Find old files",
		},
		{
			mode = "n",
			key = "fl",
			leader = true,
			map = ":Telescope live_grep_args<CR>",
			enabled = true,
			desc = "Live grep",
		},
		{
			mode = "n",
			key = "fh",
			leader = true,
			map = ":Telescope treesitter_info<CR>",
			enabled = true,
			desc = "Live grep",
		},
		{
			mode = "n",
			key = "fn",
			leader = true,
			map = ":Telescope node_packages<CR>",
			enabled = true,
			desc = "Live grep",
		},
		{
			mode = "n",
			key = "fm",
			leader = true,
			map = ":Telescope notify<CR>",
			enabled = false,
			desc = "Live grep",
		},

		-- LSP related
		{
			mode = "n",
			key = "gd",
			leader = false,
			map = function()
				require("telescope.builtin").lsp_definitions()
			end,
			enabled = true,
			desc = "Go to definition",
		},
		{
			mode = "n",
			key = "gr",
			leader = false,
			map = function()
				require("telescope.builtin").lsp_references()
			end,
			enabled = true,
			desc = "Find references",
		},
		{
			mode = "n",
			key = "gi",
			leader = false,
			map = function()
				require("telescope.builtin").lsp_type_definitions()
			end,
			enabled = true,
			desc = "Go to type definition",
		},
		{
			mode = "n",
			key = "gh",
			leader = true,
			map = function()
				vim.lsp.buf.hover({
					title = "Describe",
					title_pos = "center",
				})
			end,
			enabled = true,
			desc = "Show diagnostic",
		},
		{
			mode = "n",
			key = "rn",
			leader = true,
			map = "<cmd>lua vim.lsp.buf.rename()<CR>",
			enabled = true,
			desc = "Rename symbol",
		},
		{
			mode = "n",
			key = "ld",
			leader = true,
			map = function()
				vim.diagnostic.open_float({ source = true, border = "rounded" })
			end,
			enabled = true,
			desc = "Show diagnostic",
		},

		-- Language specific
		{ mode = "n", key = "lg", leader = true, map = ":lua _Git()<CR>", enabled = true, desc = "Git commands" },
		{ mode = "n", key = "lu", leader = true, map = ":lua _Lua()<CR>", enabled = true, desc = "Lua commands" },
		{ mode = "n", key = "nd", leader = true, map = ":lua _Node()<CR>", enabled = true, desc = "Node commands" },
		{ mode = "n", key = "py", leader = true, map = ":lua _Python()<CR>", enabled = true, desc = "Python commands" },
		{ mode = "n", key = "sq", leader = true, map = ":lua _Sql()<CR>", enabled = true, desc = "SQL commands" },

		-- UI toggles
		{
			mode = "n",
			key = "nh",
			leader = true,
			map = ":set nohlsearch<CR>",
			enabled = true,
			desc = "Clear search highlight",
		},
		{ mode = "n", key = "ms", leader = true, map = ":Mason<CR>", enabled = true, desc = "Open Mason" },

		-- Code companion
		{
			mode = "n",
			key = "cc",
			leader = true,
			map = ":CodeCompanionChat Toggle<CR>",
			enabled = true,
			desc = "Toggle chat",
		},
		{
			mode = "n",
			key = "ca",
			leader = true,
			map = ":CodeCompanionActions<CR>",
			enabled = true,
			desc = "Code actions",
		},
		{
			mode = "v",
			key = "ca",
			leader = true,
			map = ":'<,'>CodeCompanionActions<CR>",
			enabled = true,
			desc = "Code actions (visual)",
		},

		-- Hop navigation
		{ mode = "n", key = "hw", leader = true, map = ":HopWord<CR>", enabled = true, desc = "Hop to word" },
		{ mode = "n", key = "hl", leader = true, map = ":HopLine<CR>", enabled = true, desc = "Hop to line" },

		-- Escape mappings
		{ mode = "i", key = "jk", leader = false, map = "<ESC>", enabled = true, desc = "Escape insert mode" },
		{ mode = "v", key = "v", leader = false, map = "<ESC>", enabled = true, desc = "Escape visual mode" },
	}

	for _, map in ipairs(mapConfig) do
		if map.enabled then
			local options = vim.deepcopy(opt)
			if map.desc then
				options.desc = map.desc
			end
			keymap.set(map.mode, map.leader and "<leader>" .. map.key or map.key, map.map, options)
		end
	end
end

return M

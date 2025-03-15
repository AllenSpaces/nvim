local status, super = pcall(require, "super-installer")
local M = {}

if not status then
	vim.notify("Super-Installer is not found...")
	return
end

function M.Config()
	super.setup({
		git = "git",
		install = {
			use = {
				-- float terminal
				"akinsho/toggleterm.nvim",

				-- language server
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"neovim/nvim-lspconfig",

				-- complete
				"hrsh7th/nvim-cmp",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",

				-- code explanatory note
				"numToStr/Comment.nvim",

				-- file manage
				"nvim-tree/nvim-tree.lua",

				-- color scheme
				"wukuohao2003/miracle-of-god.git",

				-- icons
				"nvim-tree/nvim-web-devicons",

				-- status line
				"nvim-lualine/lualine.nvim",
				"WhoIsSethDaniel/lualine-lsp-progress.nvim",

				-- code hilight
				"nvim-treesitter/nvim-treesitter",
				"p00f/nvim-ts-rainbow",
				"windwp/nvim-autopairs",
				"windwp/nvim-ts-autotag",

				-- telescope
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",

				-- smooth scroll
				"psliwka/vim-smoothie",

				-- code format
				"mhartington/formatter.nvim",

				-- background transparent
				"xiyaowong/transparent.nvim",

				-- float window ui
				"MunifTanjim/nui.nvim",

				-- notify
				"rcarriga/nvim-notify",

				-- prettier command
				"folke/noice.nvim",

				-- database
				"tpope/vim-dadbod",
				"kristijanhusak/vim-dadbod-ui",
			},
		},

		keymaps = {
			install = "<leader>si",
			remove = "<leader>sr",
			update = "<leader>su",
		},
	})
end

return M

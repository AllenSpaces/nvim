local status, super = pcall(require, "super-installer")
local M = {}

if not status then
	vim.notify("Super-Installer is not found...", vim.log.levels.ERROR, { title = "Nvim" })
	return
end

function M.Config()
	super.setup({
		method = "ssh",
		ui = {
			progress = {
				icon = "",
			},
			manager = {
				icon = {
					check = "󱥾",
				},
			},
		},
		keymaps = {
			install = "<leader>si",
			remove = "<leader>sr",
			update = "<leader>su",
		},
		install = {
			packages = {
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
				"AllenSpaces/miracle-of-god",

				-- icons
				"nvim-tree/nvim-web-devicons",

				-- status line
				"nvim-lualine/lualine.nvim",
				"pnx/lualine-lsp-status",

				-- code hilight
				"nvim-treesitter/nvim-treesitter",
				"p00f/nvim-ts-rainbow",
				"windwp/nvim-autopairs",
				"windwp/nvim-ts-autotag",

				-- telescope
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-live-grep-args.nvim",
				"AllenSpaces/telescope-treesitter-info",
				"AllenSpaces/telescope-node-packages.nvim",

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

				-- ai
				"olimorris/codecompanion.nvim",

				-- markdown
				"MeanderingProgrammer/render-markdown.nvim",
				"folke/snacks.nvim",

				-- progress
				"j-hui/fidget.nvim",

				-- hop
				"hadronized/hop.nvim",
			},
		},
	})
end

return M

local plugins = {

	-- Folke's good stuff
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "folke/trouble.nvim", lazy = true },

	{ "williamboman/mason.nvim", lazy = true },
	{ "williamboman/mason-lspconfig.nvim", lazy = true },
	{ "neovim/nvim-lspconfig" },

	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },

	{
		"pmizio/typescript-tools.nvim",
		opts = {},
		lazy = true,
	},

	{ "folke/zen-mode.nvim", lazy = true },
	{ "folke/noice.nvim", event = "VimEnter" },
	-- End of Folke's good stuff

	{ "nvim-lua/plenary.nvim" },
	{
		"folke/todo-comments.nvim",
		opts = {},
		lazy = true,
	},
	{ "nvimdev/lspsaga.nvim", lazy = true },
	{ "onsails/lspkind.nvim", lazy = true },
	{ "ThePrimeagen/harpoon", name = "harpoon", lazy = true },
	{ "nvimtools/none-ls.nvim", dependencies = {
		"nvimtools/none-ls-extras.nvim",
	} },

	{ "mrjones2014/smart-splits.nvim", lazy = true },
	{ "kylechui/nvim-surround", lazy = true },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		lazy = true,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = true,
		keys = {
			{ "<C-n>", "<cmd>NvimTreeToggle<cr>" },
		},
	},
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
		},
		after = "nvim-tree",
	},

	{
		"nvim-treesitter/nvim-treesitter",
		defaults = {
			lazy = false,
			version = nil,
		},
		build = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"David-Kunz/treesitter-unit",
			"windwp/nvim-ts-autotag",
		},
	},
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		lazy = true,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"sindrets/diffview.nvim", -- optional - Diff integration
		},
		config = true,
		lazy = true,
	},
	{ "norcalli/nvim-colorizer.lua" },
	{ "windwp/nvim-autopairs" },
	{ "OlegGulevskyy/better-ts-errors.nvim" },
	{
		"supermaven-inc/supermaven-nvim",
		lazy = true,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons", after = "catppuccin" },
	{
		"stevearc/dressing.nvim",
	},
	{ "johann2357/nvim-smartbufs" },
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
	},
	{ "MunifTanjim/nui.nvim" },
	{ "goolord/alpha-nvim", event = "VimEnter" },
}

require("lazy").setup(plugins, opts)

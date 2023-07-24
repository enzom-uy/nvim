local plugins = {
	{ "numToStr/Comment.nvim" },
	{ "ThePrimeagen/harpoon" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},
	{ "NeogitOrg/neogit", dependencies = "nvim-lua/plenary.nvim", config = true },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "kylechui/nvim-surround" },
	{ "mrjones2014/smart-splits.nvim" },
	{ "fedepujol/move.nvim" },
	{ "ojroques/nvim-bufdel" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "nvim-tree/nvim-tree.lua" },
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
	},
	{ "hrsh7th/nvim-cmp" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"windwp/nvim-autopairs",
			"windwp/nvim-ts-autotag",
			"David-Kunz/treesitter-unit",
		},
	},
	{ "nvimdev/lspsaga.nvim", commit = "2dfb179" },
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind-nvim",
			"L3MON4D3/LuaSnip",
		},
	},
	{ "jose-elias-alvarez/null-ls.nvim" },
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},

	-- UI
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}

require("lazy").setup(plugins, opts)

local plugins = {

	-- Folke's good stuff
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "folke/trouble.nvim" },

	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },

	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },

	{
		"pmizio/typescript-tools.nvim",
		opts = {},
	},

	{ "folke/zen-mode.nvim" },
	-- End of Folke's good stuff

	{ "nvim-lua/plenary.nvim" },
	{
		"folke/todo-comments.nvim",
		opts = {},
	},
	{ "nvimdev/lspsaga.nvim" },
	{ "onsails/lspkind.nvim" },
	{ "ThePrimeagen/harpoon", name = "harpoon" },
	{ "nvimtools/none-ls.nvim", dependencies = {
		"nvimtools/none-ls-extras.nvim",
	} },

	{ "mrjones2014/smart-splits.nvim", lazy = true },
	{ "kylechui/nvim-surround" },
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		-- build = "cd app && yarn install",
		build = ":call mkdp#util#install()",
	},
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
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
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"sindrets/diffview.nvim", -- optional - Diff integration
		},
		config = true,
	},
	{ "norcalli/nvim-colorizer.lua" },
	{ "windwp/nvim-autopairs" },
	{ "OlegGulevskyy/better-ts-errors.nvim" },
	{
		"supermaven-inc/supermaven-nvim",
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{ "johann2357/nvim-smartbufs" },
}

require("lazy").setup(plugins, opts)

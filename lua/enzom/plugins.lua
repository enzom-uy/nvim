local plugins = {
  -- LSP and Autocompletion stuff
  "onsails/lspkind-nvim",
  "hrsh7th/cmp-nvim-lsp",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "glepnir/lspsaga.nvim",
  "L3MON4D3/LuaSnip",
  { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "rafamadriz/friendly-snippets",
    },
  },

  -- Formatting
  "jose-elias-alvarez/null-ls.nvim",

  -- UI
  "nvim-lualine/lualine.nvim",
  "folke/zen-mode.nvim",
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }, tag = "nightly" },
  "akinsho/nvim-bufferline.lua",
  "stevearc/dressing.nvim",
  "goolord/alpha-nvim",

  -- Tools
  "numToStr/Comment.nvim",
  "kylechui/nvim-surround",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "mbbill/undotree",
  { "David-Kunz/treesitter-unit", lazy = true },
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "norcalli/nvim-colorizer.lua",

  "TimUntersberger/neogit",
  "lewis6991/gitsigns.nvim",

  -- Appearance
  "luisiacc/gruvbox-baby",

  -- QOL
  "ojroques/nvim-bufdel",
  { "fedepujol/move.nvim", event = "BufEnter" },

  "mrjones2014/smart-splits.nvim",

  -- Utilities
  "nvim-lua/plenary.nvim",
}

require("lazy").setup(plugins)

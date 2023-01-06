local plugins = {
  -- LSP, autocompletion and Treesitter stuff.
  "onsails/lspkind-nvim",
  "hrsh7th/cmp-nvim-lsp",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "glepnir/lspsaga.nvim",
  "L3MON4D3/LuaSnip",
  { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = function() require("treesitter-context").setup() end,
  },
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
  { "jose-elias-alvarez/null-ls.nvim", after = "BufEnter" },

  -- UI
  "nvim-lualine/lualine.nvim",
  { "XXiaoA/zen-mode.nvim", cmd = "ZenMode", enabled = true },
  { "nvim-tree/nvim-web-devicons" },
  "akinsho/nvim-bufferline.lua",
  { "stevearc/dressing.nvim", event = "VeryLazy" },
  "goolord/alpha-nvim",

  -- Tools
  { "numToStr/Comment.nvim", event = "BufEnter" },
  { "kylechui/nvim-surround", event = "BufEnter" },
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufEnter" },
  { "mbbill/undotree", event = "BufEnter" },
  { "David-Kunz/treesitter-unit", lazy = true },
  { "nvim-telescope/telescope.nvim", event = "VeryLazy" },
  { "nvim-telescope/telescope-ui-select.nvim", event = "VeryLazy" },
  { "nvim-telescope/telescope-file-browser.nvim" },
  {
    "nvim-tree/nvim-tree.lua",
    version = "nightly",
  },
  { "windwp/nvim-autopairs", event = "BufEnter" },
  { "windwp/nvim-ts-autotag", event = "BufEnter" },
  { "mrjones2014/nvim-ts-rainbow" },
  { "norcalli/nvim-colorizer.lua", event = "BufEnter" },

  { "TimUntersberger/neogit", cmd = "Neogit" },
  { "lewis6991/gitsigns.nvim", event = "BufEnter" },

  -- Note taking
  { "iamcco/markdown-preview.nvim", build = function() vim.fn["mkdp#util#install"]() end, ft = "markdown" },
  { "jghauser/follow-md-links.nvim", ft = "markdown" },
  { "dhruvasagar/vim-table-mode" },

  -- Colorschemes
  { "luisiacc/gruvbox-baby", lazy = false, enabled = false },
  { "shaunsingh/oxocarbon.nvim", lazy = false, enabled = false },
  { "navarasu/onedark.nvim", lazy = false, enabled = false },
  { "folke/tokyonight.nvim", lazy = false, enabled = true },

  -- QOL
  { "ojroques/nvim-bufdel", event = "BufEnter" },
  { "fedepujol/move.nvim", event = "BufEnter" },
  { "mrjones2014/smart-splits.nvim", event = "VeryLazy" },

  -- Utilities
  "nvim-lua/plenary.nvim",

  -- ChatGPT?
  { "jackMort/ChatGPT.nvim", dependencies = {
    "MunifTanjim/nui.nvim",
  } },
}

require("lazy").setup(plugins)

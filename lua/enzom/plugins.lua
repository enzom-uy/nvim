local status, packer = pcall(require, "packer")
if not status then
  print "Packer is not installed"
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use "onsails/lspkind-nvim"
  use "hrsh7th/cmp-nvim-lsp"
  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-cmp"
  use { "glepnir/lspsaga.nvim" }
  use "L3MON4D3/LuaSnip"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use {
    "nvim-treesitter/nvim-treesitter-context",
    config = function() require("treesitter-context").setup() end,
  }
  use {
    "danymat/neogen",
    config = true,
    tag = "*",
  }
  use {
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "rafamadriz/friendly-snippets",
    },
  }
  -- Formatting
  use { "jose-elias-alvarez/null-ls.nvim" }
  -- UI
  use "nvim-lualine/lualine.nvim"
  use { "nvim-tree/nvim-web-devicons" }
  use "akinsho/nvim-bufferline.lua"
  use "goolord/alpha-nvim"
  -- Tools
  use { "numToStr/Comment.nvim" }
  use { "kylechui/nvim-surround" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use { "mbbill/undotree" }
  use { "David-Kunz/treesitter-unit" }
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use {
    "nvim-tree/nvim-tree.lua",
    tag = "nightly",
  }
  use { "windwp/nvim-autopairs" }
  use { "windwp/nvim-ts-autotag" }
  use { "mrjones2014/nvim-ts-rainbow" }
  use { "NvChad/nvim-colorizer.lua" }
  use { "rest-nvim/rest.nvim" }
  use { "TimUntersberger/neogit" }
  use { "lewis6991/gitsigns.nvim" }
  -- Note taking
  use { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, ft = "markdown" }
  use { "jghauser/follow-md-links.nvim", ft = "markdown" }
  use { "dhruvasagar/vim-table-mode" }
  -- Colorschemes
  use {
    "svrana/neosolarized.nvim",
    requires = { "tjdevries/colorbuddy.nvim" },
  }
  -- QOL
  use { "ojroques/nvim-bufdel" }
  use { "fedepujol/move.nvim" }
  use { "mrjones2014/smart-splits.nvim" }
  -- Utilities
  use "nvim-lua/plenary.nvim"
end)

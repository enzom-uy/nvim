local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use {"wbthomason/packer.nvim"}
  use { "lewis6991/impatient.nvim", config = function()
    require('impatient')
  end }
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- UI
  use({ "ellisonleao/gruvbox.nvim" })
  use { "lukas-reineke/indent-blankline.nvim", event = "BufRead" }
  use("kyazdani42/nvim-web-devicons")
  use { "hoob3rt/lualine.nvim", after = "gruvbox.nvim" }
  use { "akinsho/nvim-bufferline.lua", after = "gruvbox.nvim", config = function() require('bufferline').setup {} end }

  -- Navigation
  use { "nvim-lua/telescope.nvim" }
  use{ "nvim-telescope/telescope-ui-select.nvim" }
  use("nvim-telescope/telescope-fzy-native.nvim")
  use{ "kyazdani42/nvim-tree.lua" }

  -- Quality of life for myself
use { 'echasnovski/mini.nvim', config = function()
    require('mini.surround').setup({
      n_lines = 20,
      highlight_duration = 500,
      funname_pattern = '[%w_%.]+',
      mappings = {
        add = 'cs', -- Add surrounding
        delete = 'ds', -- Delete surrounding
        replace = 'rs', -- Replace surrounding
      },
    })
  end, event = "BufEnter" }
  use { 'fedepujol/move.nvim', event = "BufEnter" }
  use { "mbbill/undotree", event = "BufEnter" }
  use { "b3nj5m1n/kommentary", event = "BufEnter" }
  use { "norcalli/nvim-colorizer.lua", config = function()
    require("colorizer").setup()
  end, after = "gruvbox.nvim" }
  use { "johann2357/nvim-smartbufs", event = "BufEnter"}
  -- Treesitter and LSP
  use { "windwp/nvim-ts-autotag", config = function() require('nvim-ts-autotag').setup() end }
  use { "windwp/nvim-autopairs", config = function() require('nvim-autopairs').setup {} end }
  use { "David-Kunz/treesitter-unit", after = "nvim-treesitter" }
  use{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "neovim/nvim-lspconfig" }
  use("williamboman/nvim-lsp-installer")
  use({ "RishabhRD/nvim-lsputils", requires = { "RishabhRD/popfix" } })
  use("tami5/lspsaga.nvim")
  use("L3MON4D3/LuaSnip")
  use("onsails/lspkind-nvim")
  use { "jose-elias-alvarez/null-ls.nvim" }
  use({ "hrsh7th/vim-vsnip", requires = { "hrsh7th/vim-vsnip-integ", "rafamadriz/friendly-snippets" } })
  use{"rafamadriz/friendly-snippets", module = "cmp_nvim_lsp", event = "InsertEnter"}
  use {
    "hrsh7th/nvim-cmp",
    branch = "dev",
    after = "friendly-snippets",
    requires = { "onsails/lspkind-nvim" },
    { "hrsh7th/cmp-nvim-lsp" },
  }
  use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }

  -- Git and copilot
  use { 'TimUntersberger/neogit', opt = true, cmd = { "Neogit" } }
  use {
    "zbirenbaum/copilot.lua",
    event = { "BufEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end
  }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
  use { "wbthomason/packer.nvim" }
  use { "lewis6991/impatient.nvim", config = function() require('impatient') end }
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use { "ellisonleao/gruvbox.nvim" }
  use { "kyazdani42/nvim-web-devicons" }
  use { "hoob3rt/lualine.nvim", after = "gruvbox.nvim" }
  use { "akinsho/nvim-bufferline.lua", after = "gruvbox.nvim", config = function() require('bufferline').setup {} end }
  use { "nvim-lua/telescope.nvim" }
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use { "nvim-telescope/telescope-fzy-native.nvim" }
  use { "kyazdani42/nvim-tree.lua" }
  use { 'echasnovski/mini.nvim', config = function()
    require('mini.surround').setup({
      n_lines = 20,
      highlight_duration = 500,
      mappings = {
        add = 'cs',
        delete = 'ds',
        replace = 'rs',
      },
    })
  end, event = "BufEnter" }
  use { 'fedepujol/move.nvim', event = "BufEnter" }
  use { "mbbill/undotree", event = "BufEnter" }
  use { "b3nj5m1n/kommentary", event = "BufEnter" }
  use { "norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup() end, after = "gruvbox.nvim" }
  use { "windwp/nvim-ts-autotag", config = function() require('nvim-ts-autotag').setup() end }
  use { "windwp/nvim-autopairs", config = function() require('nvim-autopairs').setup {} end }
  use { "David-Kunz/treesitter-unit", after = "nvim-treesitter" }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/nvim-lsp-installer" }
  use { "RishabhRD/nvim-lsputils", requires = { "RishabhRD/popfix" } }
  use { "tami5/lspsaga.nvim" }
  use { "L3MON4D3/LuaSnip" }
  use { "onsails/lspkind-nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use { "rafamadriz/friendly-snippets", module = "cmp_nvim_lsp", event = "InsertEnter" }
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
end)

local queries = require "nvim-treesitter.query"
local ts_query = require "vim.treesitter.query"
local parsers = require "nvim-treesitter.parsers"
local utils = require "nvim-treesitter.utils"
local caching = require "nvim-treesitter.caching"

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "tsx",
    "typescript",
  },
  highlight = { enable = true, use_languagetree = true },
  autotag = { enable = true },
  indent = {
    enable = true
  }
})

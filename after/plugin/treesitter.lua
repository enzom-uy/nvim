local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then return end

ts.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "org" },
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "tsx",
    "typescript",
    "javascript",
    "bash",
    "json",
    "css",
    "html",
    "lua",
    "prisma",
    "astro",
    "lua",
    "markdown",
  },
  autotag = {
    enable = true,
  },
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

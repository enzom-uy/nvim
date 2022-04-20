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
	highlight = { enable = true, disable = {} },
	autotag = { enable = true },
	indent = {
		enable = true,
		disable = {},
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

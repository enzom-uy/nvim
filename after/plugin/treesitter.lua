local status, ts = pcall(require, "nvim-treesitter.configs")
require("treesitter-context").setup()
if not status then
	return
end

require("nvim-ts-autotag").setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
	-- Also override individual filetype configs, these take priority.
	-- Empty by default, useful if one of the "opts" global settings
	-- doesn't work well in a specific filetype
})

ts.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"markdown",
		"markdown_inline",
		"tsx",
		"typescript",
		"javascript",
		"toml",
		"json",
		"yaml",
		"css",
		"html",
		"lua",
		"astro",
	},
})

require("ts_context_commentstring").setup()
vim.g.skip_ts_context_commentstring_module = true

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

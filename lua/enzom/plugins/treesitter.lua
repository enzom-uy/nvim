return {
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
	config = function()
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
				"prisma",
			},
		})

		require("ts_context_commentstring").setup()
		vim.g.skip_ts_context_commentstring_module = true

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
	end,
}

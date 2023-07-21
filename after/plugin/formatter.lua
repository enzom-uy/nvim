-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		typescriptreact = { require("formatter.filetypes.typescriptreact").prettierd },
		typescript = { require("formatter.filetypes.typescriptreact").prettierd },
		javascript = { require("formatter.filetypes.typescriptreact").prettierd },
		javascriptreact = { require("formatter.filetypes.typescriptreact").prettierd },
		json = { require("formatter.filetypes.json").prettierd },
		markdown = { require("formatter.filetypes.markdown").markdownlint },

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.cmd([[ augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END ]])

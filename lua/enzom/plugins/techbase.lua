return {
	"mcauley-penney/techbase.nvim",
	opts = {
		-- set to true to make the background, floating windows, statusline,
		-- signcolumn, foldcolumn, and tabline transparent
		transparent = true,

		-- allows you to override any highlight group for finer-grained control
		overrides = {},
	},
	config = function(_, opts)
		require("techbase").setup(opts)
		vim.cmd.colorscheme("techbase")
	end,
	priority = 1000,
}

return {
	"folke/zen-mode.nvim",
	lazy = true,
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 0.95,
				width = 120,
				height = 1,
				options = {},
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
					laststatus = 0, -- turn off the statusline in zen mode
				},
				twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
				gitsigns = { enabled = false }, -- disables git signs
				tmux = { enabled = false }, -- disables the tmux statusline
				wezterm = {
					enabled = true,
					font = "+4",
				},
			},
			on_open = function(win) end,
			on_close = function() end,
		})
	end,
}

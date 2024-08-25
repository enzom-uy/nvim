return {
	"OlegGulevskyy/better-ts-errors.nvim",
	lazy = true,
	config = function()
		require("better-ts-errors").setup({
			keymaps = {
				toggle = "<leader>dd", -- Toggling keymap
				go_to_definition = "<leader>dx", -- Go to problematic type from popup window
			},
		})
	end,
}

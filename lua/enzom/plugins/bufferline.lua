return {
	"akinsho/bufferline.nvim",
	enabled = false,
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	after = "catppuccin",
	config = function()
		local bufferline = require("bufferline")
		local mocha = require("catppuccin.palettes").get_palette("mocha")

		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
				style_preset = bufferline.style_preset.default,
				separator_style = "thick",
			},
		})
	end,
}

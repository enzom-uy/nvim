return {
	"akinsho/bufferline.nvim",
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
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = { "italic", "bold" },
				custom = {
					all = {
						fill = { bg = "NONE" },
					},
					mocha = {
						background = { fg = mocha.text },
					},
					latte = {
						background = { fg = "#000000" },
					},
				},
			}),
		})
	end,
}

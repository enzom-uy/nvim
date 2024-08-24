local bufferline = require("bufferline")

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		style_preset = bufferline.style_preset.default,
		separator_style = "thick",
	},
})

vim.cmd([[

augroup MyColors

autocmd!

autocmd ColorScheme * highlight BufferLineFill guibg=NONE

autocmd ColorScheme * highlight BufferLineSeparator guifg=NONE

autocmd ColorScheme * highlight BufferLineSeparatorSelected guifg=NONE

augroup END

]])

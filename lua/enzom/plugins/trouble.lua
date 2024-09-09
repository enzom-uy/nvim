return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	-- cmd = "Trouble",
	config = function()
		require("trouble").setup({})

		vim.cmd([[
          nnoremap <silent> <leader>xx :Trouble<CR>
        ]])
	end,
}

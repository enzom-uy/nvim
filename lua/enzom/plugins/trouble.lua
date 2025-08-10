return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	-- cmd = "Trouble",
	config = function()
		require("trouble").setup({})
		vim.keymap.set("n", "<leader>xx", function()
			vim.cmd("Trouble")
		end, { desc = "Trouble (trouble.nvim)" })
	end,
}

return {
	"gmr458/cold.nvim",
	name = "cold",
	priority = 1000,
	config = function()
		require("cold").setup({
			transparent_background = true,
		})
	end,
}

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	version = "*",
	lazy = true,
	keys = {
		{ "<C-n>", "<cmd>NvimTreeToggle<cr>" },
	},
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
			update_focused_file = {
				enable = true,
			},
		})
	end,
}

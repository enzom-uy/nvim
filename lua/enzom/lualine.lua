local lualine = require("lualine")

local left_pad = ""
local right_pad = ""

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "tokyodark",
		component_separators = "|",
		section_separators = { left = left_pad, right = right_pad },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename", "lsp_progress" },
		lualine_x = { "lsp_progress", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "fugitive", "fzf" },
})

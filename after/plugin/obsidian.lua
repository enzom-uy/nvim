require("obsidian").setup({
	workspaces = {
		{
			name = "enzo",
			path = "~/obsidian/",
		},
	},
	completion = {
		nvim_cmp = true,
		min_chars = 2,
		new_notes_location = "current_dir",
		prepend_note_id = true,
		prepend_note_path = false,
		use_path_only = false,
	},
	finder = "telescope.nvim",
})

vim.keymap.set("n", "gf", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return "<cmd>ObsidianFollowLink<CR>"
	else
		return "gf"
	end
end)

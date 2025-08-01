return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	tag = "0.1.8",
	config = function()
		local status, telescope = pcall(require, "telescope")
		if not status then
			return
		end
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local open_with_trouble = require("trouble.sources.telescope").open

		telescope.setup({
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "ignore_case",
				},
			},

			defaults = {
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				file_sorter = require("telescope.sorters").get_fuzzy_file,

				mappings = {
					n = {
						["q"] = actions.close,
					},
					i = {
						["<C-n>"] = actions.move_selection_next,
						["<C-t>"] = open_with_trouble,
						["<C-p>"] = actions.move_selection_previous,
					},
				},
				file_ignore_patterns = {
					"%.git/",
					"node_modules/",
					"coverage/",
					"__pycache__/",
					"package-lock",
					".next/",
					"venv/",
					".dropbox",
					".dropbox.cache",
					"dist/",
					"build/",
					".png",
				},
			},
		})

		require("telescope").load_extension("fzf")

		-- vim.keymap.set("n", ";sf", function()
		-- 	builtin.find_files({
		-- 		no_ignore = true,
		-- 		hidden = true,
		-- 	})
		-- end)
		vim.keymap.set("n", ";r", function()
			builtin.live_grep()
		end)
		vim.keymap.set("n", ";sb", function()
			builtin.buffers()
		end)
		vim.keymap.set("n", ";;", function()
			builtin.resume()
		end)
		vim.keymap.set("n", ";e", function()
			builtin.diagnostics()
		end)
	end,
}

local telescope = require("telescope")
local telescope_actions = require("telescope.actions")

telescope.setup({
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor({}),
    },
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
  },
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = "> ",
    color_devicons = true,

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    file_ignore_patterns = {
      "%.git/",
      "node_modules/",
      "coverage/",
      "__pycache__/",
      "%.o",
      "package-lock",
      ".next/",
    },
    mappings = {
      i = {
        ["<C-k>"] = telescope_actions.move_selection_previous,
        ["<C-j>"] = telescope_actions.move_selection_next,
      },
    },
  },
})

require("telescope").load_extension("ui-select")

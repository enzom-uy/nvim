local status, telescope = pcall(require, "telescope")
if not status then return end
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"
local fileActions = require("telescope").extensions.file_browser.actions

telescope.setup {
  defaults = {
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    mappings = {
      n = {
        ["q"] = actions.close,
        ["a"] = fileActions.create,
        ["m"] = fileActions.move,
        ["d"] = fileActions.remove,
        ["r"] = fileActions.rename,
      },
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
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
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor {},
    },
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
  },
}

vim.keymap.set("n", ";f", function()
  builtin.find_files {
    hidden = true,
  }
end)
vim.keymap.set("n", ";g", function() builtin.live_grep() end)
vim.keymap.set("n", "\\\\", function() builtin.buffers() end)
vim.keymap.set("n", "<leader>r;", function() builtin.resume() end)
vim.keymap.set("n", ";e", function() builtin.diagnostics() end)
require("telescope").load_extension "ui-select"
require("telescope").load_extension "file_browser"

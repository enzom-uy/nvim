local keymap = vim.keymap

vim.opt.cc = "80"

local searchLinks = ":/(.*.md)<CR>n"

keymap.set("n", "<leader>l", searchLinks)

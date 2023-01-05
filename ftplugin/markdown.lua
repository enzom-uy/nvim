local keymap = vim.keymap

vim.opt.cc = "80"
vim.opt.conceallevel = 2

local searchLinks = ":/(.*.md)<CR>n"

keymap.set("n", "<leader>l", searchLinks, { silent = true })

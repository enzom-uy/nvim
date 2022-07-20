local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-f>", '<Cmd>lua require "telescope.builtin".find_files({hidden = true})<CR>', opts)
keymap("n", "\\", "<Cmd>Telescope buffers<CR>", opts)
keymap("n", ",g", '<Cmd>lua require "telescope.builtin".live_grep()<CR>', opts)
keymap("n", "<C-n>", "<Cmd>NvimTreeFindFileToggle<CR>", opts)
keymap("n", "<A-/>", "<Cmd>ToggleTerm direction=float<CR>", opts)
keymap("n", "<C-d>", "<Cmd>BufDel<CR>", opts)
keymap("n", "<C-j>", "<C-w><C-j>", opts)
keymap("n", "<C-k>", "<C-w><C-k>", opts)
keymap("n", "<C-l>", "<C-w><C-l>", opts)
keymap("n", "<C-h>", "<C-w><C-h>", opts)
keymap("i", "jk", "<ESC>", opts)
keymap("n", "q", ":q!<CR>", opts)
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "md", ":Lspsaga show_line_diagnostics<CR>", opts)
keymap("n", "<S-j>", ":Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "<Leader>v", ":vsp<CR>", opts)
keymap("n", "<Leader>h", ":sp<CR>", opts)
keymap("n", "<C-j>", "<C-d>", opts)
keymap("n", "<C-k>", "<C-u>", opts)
keymap("n", "<S-y>", "y$", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", ",", ",<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprev<CR>", opts)

--- Treesitter-units
keymap("x", "iu", ':lua require"treesitter-unit".select()<CR>', opts)
keymap("x", "au", ':lua require"treesitter-unit".select(true)<CR>', opts)
keymap("o", "iu", ':<c-u>lua require"treesitter-unit".select()<CR>', opts)
keymap("o", "au", ':<c-u>lua require"treesitter-unit".select(true)<CR>', opts)

--- Lsp
keymap("n", "<Leader>rn", ":Lspsaga rename<CR>", opts)
keymap("n", "<Leader>f", "<Cmd>lua vim.lsp.buf.format()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gw", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
keymap("n", "<leader>le", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

-- Replacement for lspsaga
local diag_opts = '{ width = 80, focusable = false, border = "single" }'
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "<leader>af", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>ls", "<cmd>lua vim.diagnostic.open_float(" .. diag_opts .. ")<CR>", opts)

--- Move.lua
keymap("n", "<A-j>", ":MoveLine(1)<CR>", opts)
keymap("n", "<A-k>", ":MoveLine(-1)<CR>", opts)
keymap("v", "<A-j>", ":MoveBlock(1)<CR>", opts)
keymap("v", "<A-k>", ":MoveBlock(-1)<CR>", opts)
keymap("n", "<A-l>", ":MoveHChar(1)<CR>", opts)
keymap("n", "<A-h>", ":MoveHChar(-1)<CR>", opts)
keymap("v", "<A-l>", ":MoveHBlock(1)<CR>", opts)
keymap("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts)

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-f>", '<Cmd>lua require "telescope.builtin".git_files({hidden = true})<CR>', opts)
keymap("n", "tco", '<Cmd>lua require "telescope.builtin".git_commits({hidden = true})<CR>', opts)
keymap("n", ",g", '<Cmd>lua require "telescope.builtin".live_grep()<CR>', opts)
keymap("n", "<leader>z", '<Cmd>lua require "enzom.utils".reload_config()<CR>', opts)
keymap("n", "<C-n>", "<Cmd>NvimTreeFindFileToggle<CR>", opts)
keymap("n", "<C-d>", "<Cmd>bd<CR>", opts)
keymap("n", "<C-j>", "<C-w><C-j>", opts)
keymap("n", "<C-k>", "<C-w><C-k>", opts)
keymap("n", "<C-l>", "<C-w><C-l>", opts)
keymap("n", "<C-h>", "<C-w><C-h>", opts)
keymap("i", "jk", "<ESC>", opts)
keymap("n", "<leader>p", "<Cmd>PrettierAsync<CR>", opts)
keymap("n", "q", ":q!<CR>", opts)
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", ",c", ":Commentary<CR>", opts)
keymap("n", "<leader>r", ":%s/", opts)
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


-- Preventing me from being an idiot
keymap("n", "<Left>", "<nop>", opts)
keymap("n", "<Up>", "<nop>", opts)
keymap("n", "<Down>", "<nop>", opts)
keymap("n", "<Right>", "<nop>", opts)

keymap("i", "<Left>", "<nop>", opts)
keymap("i", "<Up>", "<nop>", opts)
keymap("i", "<Down>", "<nop>", opts)
keymap("i", "<Right>", "<nop>", opts)

keymap("v", "<Left>", "<nop>", opts)
keymap("v", "<Up>", "<nop>", opts)
keymap("v", "<Down>", "<nop>", opts)
keymap("v", "<Right>", "<nop>", opts)

-- Smartbufs stuff
--- Go to buffer:
keymap("n", "<Leader>1", ":lua require('nvim-smartbufs').goto_buffer(1)<CR>", opts)
keymap("n", "<Leader>2", ":lua require('nvim-smartbufs').goto_buffer(2)<CR>", opts)
keymap("n", "<Leader>3", ":lua require('nvim-smartbufs').goto_buffer(3)<CR>", opts)
keymap("n", "<Leader>4", ":lua require('nvim-smartbufs').goto_buffer(4)<CR>", opts)
keymap("n", "<Leader>5", ":lua require('nvim-smartbufs').goto_buffer(5)<CR>", opts)
keymap("n", "<Leader>6", ":lua require('nvim-smartbufs').goto_buffer(6)<CR>", opts)
keymap("n", "<Leader>7", ":lua require('nvim-smartbufs').goto_buffer(7)<CR>", opts)
keymap("n", "<Leader>8", ":lua require('nvim-smartbufs').goto_buffer(8)<CR>", opts)
keymap("n", "<Leader>9", ":lua require('nvim-smartbufs').goto_buffer(9)<CR>", opts)

--- Improved :bnext and :bprev behavior without considering terminal buffers
keymap("n", "<Tab>", ":lua require('nvim-smartbufs').goto_next_buffer()<CR>", opts)
keymap("n", "<S-Tab>", ":lua require('nvim-smartbufs').goto_prev_buffer()<CR>", opts)

--- Delete the N buffer according to :ls buffer list
keymap("n", "<Leader>q1", ":lua require('nvim-smartbufs').close_buffer(1)<CR>", opts)
keymap("n", "<Leader>q2", ":lua require('nvim-smartbufs').close_buffer(2)<CR>", opts)
keymap("n", "<Leader>q3", ":lua require('nvim-smartbufs').close_buffer(3)<CR>", opts)
keymap("n", "<Leader>q4", ":lua require('nvim-smartbufs').close_buffer(4)<CR>", opts)
keymap("n", "<Leader>q5", ":lua require('nvim-smartbufs').close_buffer(5)<CR>", opts)
keymap("n", "<Leader>q6", ":lua require('nvim-smartbufs').close_buffer(6)<CR>", opts)
keymap("n", "<Leader>q7", ":lua require('nvim-smartbufs').close_buffer(7)<CR>", opts)
keymap("n", "<Leader>q8", ":lua require('nvim-smartbufs').close_buffer(8)<CR>", opts)
keymap("n", "<Leader>q9", ":lua require('nvim-smartbufs').close_buffer(9)<CR>", opts)

-- ToggleTerm Float mode
keymap("n", "<A-/>", "<Cmd>ToggleTerm direction=float<CR>", opts)

--- Treesitter-units
keymap('x', 'iu', ':lua require"treesitter-unit".select()<CR>', opts)
keymap('x', 'au', ':lua require"treesitter-unit".select(true)<CR>', opts)
keymap('o', 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>', opts)
keymap('o', 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>', opts)

--- Lsp
keymap("n", "<Leader>rn", "<Cmd>lua require('lspsaga.rename').rename()<CR>", opts)
keymap("n", "<Leader>f", "<Cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gw", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
keymap("n", "<leader>le", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

-- Replacement for lspsaga
local diag_opts = '{ width = 80, focusable = false, border = "single" }'
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "<leader>af", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>ls", "<cmd>lua vim.diagnostic.open_float(" .. diag_opts .. ")<CR>", opts)

--- Move.lua
keymap('n', '<A-j>', ":MoveLine(1)<CR>", opts)
keymap('n', '<A-k>', ":MoveLine(-1)<CR>", opts)
keymap('v', '<A-j>', ":MoveBlock(1)<CR>", opts)
keymap('v', '<A-k>', ":MoveBlock(-1)<CR>", opts)
keymap('n', '<A-l>', ":MoveHChar(1)<CR>", opts)
keymap('n', '<A-h>', ":MoveHChar(-1)<CR>", opts)
keymap('v', '<A-l>', ":MoveHBlock(1)<CR>", opts)
keymap('v', '<A-h>', ":MoveHBlock(-1)<CR>", opts)

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x', opts)

keymap.set("n", "<leader>q", ":q<CR>", opts)

keymap.set("i", "jk", "<Esc>", opts)

keymap.set("n", "<leader>d", ":lua require('nvim-smartbufs').close_current_buffer()<CR>", opts)
keymap.set("n", "<S-h>", ":lua require('nvim-smartbufs').goto_prev_buffer()<CR>", opts)
keymap.set("n", "<S-l>", ":lua require('nvim-smartbufs').goto_next_buffer()<CR>", opts)

keymap.set("n", "<C-s>", ":w<CR>", opts)

-- keymap.set("n", "<C-j>", "<C-d>", opts)
-- keymap.set("n", "<C-k>", "<C-u>", opts)

keymap.set("n", "<Space>d", ":%bd|e#<CR>", opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d', opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- New tab
keymap.set("n", "te", ":tabedit", opts)
-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w", opts)
keymap.set("n", "sv", ":vsplit<Return><C-w>w", opts)
-- Move window
keymap.set("n", "<Space>", "<C-w>w", opts)
keymap.set("", "sh", "<C-w>h", opts)
keymap.set("", "sk", "<C-w>k", opts)
keymap.set("", "sj", "<C-w>j", opts)
keymap.set("", "sl", "<C-w>l", opts)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><", opts)
keymap.set("n", "<C-w><right>", "<C-w>>", opts)
keymap.set("n", "<C-w><up>", "<C-w>+", opts)
keymap.set("n", "<C-w><down>", "<C-w>-", opts)

keymap.set("n", "<leader>gi", ":Neogit<CR>", opts)

-- Treesitter-units
keymap.set("x", "iu", ':lua require"treesitter-unit".select()<CR>', opts)
keymap.set("x", "au", ':lua require"treesitter-unit".select(true)<CR>', opts)
keymap.set("o", "iu", ':<c-u>lua require"treesitter-unit".select()<CR>', opts)
keymap.set("o", "au", ':<c-u>lua require"treesitter-unit".select(true)<CR>', opts)

-- Harpoon
keymap.set("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap.set("n", "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap.set("n", "<A-1>", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap.set("n", "<A-2>", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap.set("n", "<A-3>", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap.set("n", "<A-4>", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)

-- Zen Mode
keymap.set("n", "<space>z", ":ZenMode<CR>", opts)

keymap.set("n", "<leader>t", ":Lspsaga term_toggle<CR>", opts)

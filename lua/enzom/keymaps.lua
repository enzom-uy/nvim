local keymap = vim.keymap
local optsWithoutDesc = { noremap = true, silent = true }

local opts = function(desc)
    return { noremap = true, silent = true, desc = desc }
end

keymap.set("n", "x", '"_x', optsWithoutDesc)
keymap.set("x", "p", function()
    return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true }, optsWithoutDesc)

keymap.set("n", "<leader>q", ":q<CR>", optsWithoutDesc)

keymap.set("i", "jk", "<Esc>", optsWithoutDesc)

keymap.set("n", "<leader>d", ":lua require('nvim-smartbufs').close_current_buffer()<CR>", opts("Close current buffer."))
keymap.set("n", "<S-h>", ":BufferPrevious<CR>", opts("Previous buffer"))
keymap.set("n", "<S-l>", ":BufferNext<CR>", opts("Next buffer"))

keymap.set("n", "<C-s>", ":w<CR>", opts("Save file"))

keymap.set("n", "<Space>d", ":%bd|e#<CR>", opts("Delete all buffers"))

-- Increment/decrement
keymap.set("n", "+", "<C-a>", optsWithoutDesc)
keymap.set("n", "-", "<C-x>", optsWithoutDesc)

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d', optsWithoutDesc)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", optsWithoutDesc)

-- Split window
keymap.set("n", "<leader>ss", ":split<Return><C-w>w", opts("Split window horizontally"))
keymap.set("n", "<leader>sv", ":vsplit<Return><C-w>w", opts("Split window vertically"))

-- Move window
keymap.set("", "sh", "<C-w>h", optsWithoutDesc)
keymap.set("", "sk", "<C-w>k", optsWithoutDesc)
keymap.set("", "sj", "<C-w>j", optsWithoutDesc)
keymap.set("", "sl", "<C-w>l", optsWithoutDesc)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><", optsWithoutDesc)
keymap.set("n", "<C-w><right>", "<C-w>>", optsWithoutDesc)
keymap.set("n", "<C-w><up>", "<C-w>+", optsWithoutDesc)
keymap.set("n", "<C-w><down>", "<C-w>-", optsWithoutDesc)

keymap.set("n", "<leader>gi", ":Neogit<CR>", opts("Neogit"))

-- Treesitter-units
keymap.set("x", "iu", ':lua require"treesitter-unit".select()<CR>', optsWithoutDesc)
keymap.set("x", "au", ':lua require"treesitter-unit".select(true)<CR>', optsWithoutDesc)
keymap.set("o", "iu", ':<c-u>lua require"treesitter-unit".select()<CR>', optsWithoutDesc)
keymap.set("o", "au", ':<c-u>lua require"treesitter-unit".select(true)<CR>', optsWithoutDesc)

-- Harpoon
keymap.set("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", opts("Add harpoon"))
keymap.set("n", "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts("Toggle harpoon quick menu"))
keymap.set("n", "<A-1>", ":lua require('harpoon.ui').nav_file(1)<CR>", optsWithoutDesc)
keymap.set("n", "<A-2>", ":lua require('harpoon.ui').nav_file(2)<CR>", optsWithoutDesc)
keymap.set("n", "<A-3>", ":lua require('harpoon.ui').nav_file(3)<CR>", optsWithoutDesc)
keymap.set("n", "<A-4>", ":lua require('harpoon.ui').nav_file(4)<CR>", optsWithoutDesc)

keymap.set("n", "<leader>te", ":Lspsaga term_toggle<CR>", opts("Toggle terminal"))
keymap.set("n", "<S-j>", vim.diagnostic.goto_next, optsWithoutDesc)
keymap.set("n", "md", vim.diagnostic.open_float, optsWithoutDesc)
keymap.set("n", "K", vim.lsp.buf.hover, optsWithoutDesc)
keymap.set("n", "gd", vim.lsp.buf.definition, optsWithoutDesc)
keymap.set("n", "gt", vim.lsp.buf.type_definition, optsWithoutDesc)
keymap.set("n", "gp", vim.lsp.buf.declaration, optsWithoutDesc)
keymap.set("n", "<leader>gr", vim.lsp.buf.rename, optsWithoutDesc)
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, optsWithoutDesc)

keymap.set("n", "<leader>l", ":Twilight<CR>", opts("Toggle Twilight"))


keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", opts("Open Nvim-Tree"))

keymap.set("n", "<leader>sf", ":Pick files<CR>", opts("Open file finder"))
keymap.set("n", "<leader>r", ":Pick grep_live<CR>", opts("Open live grep"))
keymap.set("n", "<leader>;", ":Pick resume<CR>", opts("Resume last mini.pick action"))
keymap.set("n", "<leader>sb", ":Pick buffers<CR>", opts("Search buffers"))

keymap.set("n", "<leader>o", ":Oil<CR>", opts("Open Oil.nvim"))

-- close nvim-tree if it's last buffer open
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        if #vim.api.nvim_list_bufs() == 1 and vim.bo.filetype == "NvimTree" then
            vim.cmd("quit")
        end
    end,
})

-- disable automatic comment on newline
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ timeout = 150 })
    end,
})

return {
    "mrjones2014/smart-splits.nvim",
    config = function()
        require("smart-splits").setup({
            -- Ignored filetypes (only while resizing)
            ignored_filetypes = {
                "nofile",
                "quickfix",
                "prompt",
            },
            -- Ignored buffer types (only while resizing)
            ignored_buftypes = { "NvimTree", "NeoTree" },
            -- the default number of lines/columns to resize by at a time
            resize = {
                ignored_events = {
                    "BufEnter",
                    "WinEnter"
                }
            },
            -- whether to wrap to opposite side when cursor is at an edge
            -- e.g. by default, moving left at the left edge will jump
            -- to the rightmost window, and vice versa, same for up/down.
            move = {
                same_row = false,
                at_edge = "split"
            },
        })
    end,
}

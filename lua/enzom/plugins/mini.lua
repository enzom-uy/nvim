return {
    'nvim-mini/mini.nvim',
    version = false,
    enabled = true,
    config = function()
        require('mini.icons').setup()
        require('mini.statuscolumn').setup()
        require('mini.surround').setup()
        require('mini.pairs').setup()
        require('mini.pick').setup()
    end,
}

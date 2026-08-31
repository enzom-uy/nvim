return {
    'https://github.com/nvim-tree/nvim-tree.lua',
    enabled = true,
    config = function()
        require("nvim-tree").setup()
    end
}

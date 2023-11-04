local plugins = {
    { 'wbthomason/packer.nvim' },
    { 'mrjones2014/smart-splits.nvim', lazy = true },
    { 'ojroques/nvim-bufdel',          dependencies = { 'jose-elias-alvarez/nvim-bufdel' } },
    { 'ThePrimeagen/harpoon',          name = 'harpoon' },
    { 'catppuccin/nvim',               name = 'catppuccin' },
    { 'nvim-lualine/lualine.nvim',     build = function() require('lualine').setup() end },
    { 'nvim-lua/plenary.nvim' },
    { 'andweeb/presence.nvim' },
    { 'nvim-pack/nvim-spectre' },
    { 'onsails/lspkind-nvim' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'neovim/nvim-lspconfig' },
    {
        'jose-elias-alvarez/null-ls.nvim',
        build = function()
            require('null-ls').config()
        end
    },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        'nvim-tree/nvim-tree.lua',
        name = 'nvim-tree.lua'
    },
    { 'glepnir/lspsaga.nvim' },
    { 'L3MON4D3/LuaSnip' },
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = 'maintained',
                highlight = {
                    enable = true,
                },
            })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-context',
            'David-Kunz/treesitter-unit',
            'windwp/nvim-ts-autotag',
        },
    },
    { 'kyazdani42/nvim-web-devicons' },
    { 'nvim-telescope/telescope.nvim' },
    { 'windwp/nvim-autopairs' },
    {
        'numToStr/Comment.nvim',
        dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    },
    { 'norcalli/nvim-colorizer.lua' },
    { 'folke/zen-mode.nvim' },
    {
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    { 'akinsho/nvim-bufferline.lua' },
    { 'lewis6991/gitsigns.nvim' },
    { 'kylechui/nvim-surround' },
    { 'tpope/vim-fugitive' },
}

require("lazy").setup(plugins, opts)

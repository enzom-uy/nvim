local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use { "mrjones2014/smart-splits.nvim" }
    use { "ojroques/nvim-bufdel" }
    use { "ThePrimeagen/harpoon" }
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'nvim-lualine/lualine.nvim'     -- Statusline
    use 'nvim-lua/plenary.nvim'         -- Common utilities
    use 'andweeb/presence.nvim'
    use 'nvim-pack/nvim-spectre'
    use 'onsails/lspkind-nvim'            -- vscode-like pictograms
    use 'hrsh7th/cmp-buffer'              -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp'            -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp'                -- Completion
    use 'neovim/nvim-lspconfig'           -- LSP
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use { "nvim-tree/nvim-tree.lua" }

    use 'glepnir/lspsaga.nvim' -- LSP UIs
    use 'L3MON4D3/LuaSnip'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        requires = { 'nvim-treesitter/nvim-treesitter-context', 'David-Kunz/treesitter-unit', 'windwp/nvim-ts-autotag' }
    }
    use 'kyazdani42/nvim-web-devicons' -- File icons
    use 'nvim-telescope/telescope.nvim'
    use 'windwp/nvim-autopairs'
    use { 'numToStr/Comment.nvim',
        requires = {
            'JoosepAlviste/nvim-ts-context-commentstring'
        }
    }
    use 'norcalli/nvim-colorizer.lua'
    use 'folke/zen-mode.nvim'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use 'akinsho/nvim-bufferline.lua'
    -- use 'github/copilot.vim'

    use 'lewis6991/gitsigns.nvim'
    use { "kylechui/nvim-surround" }
    use "tpope/vim-fugitive"
end)

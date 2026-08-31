return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
        "David-Kunz/treesitter-unit",
        "windwp/nvim-ts-autotag",
    },

    config = function()
        require("nvim-treesitter").setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        require("nvim-treesitter").install({
            "markdown",
            "markdown_inline",
            "tsx",
            "typescript",
            "javascript",
            "toml",
            "json",
            "yaml",
            "css",
            "html",
            "lua",
            "astro",
            "prisma",
        })

        require("treesitter-context").setup({
            enable = true,
            max_lines = 5,
        })

        require("nvim-ts-autotag").setup({
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = false,
            },
        })

        -- Enable Treesitter highlighting
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                if pcall(vim.treesitter.start) then
                    -- Treesitter highlighting enabled
                end
            end,
        })
    end,
}

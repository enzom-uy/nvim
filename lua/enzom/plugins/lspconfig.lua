return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        "nvimdev/lspsaga.nvim",
    },

    config = function()
        -- LSP capabilities from blink.cmp
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- LSP servers
        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
        })

        vim.lsp.config("astro", {
            capabilities = capabilities,
        })

        vim.lsp.config("eslint", {
            capabilities = capabilities,
            settings = {
                format = false,
                workingDirectories = {
                    mode = "auto",
                },
            },
        })

        vim.lsp.enable({
            "lua_ls",
            "astro",
            "eslint",
        })

        -- Keymaps
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local opts = {
                    buffer = event.buf,
                    noremap = true,
                    silent = true,
                }
            end,
        })

        require("lspsaga").setup({
            ui = {
                border = "rounded",
                height = 30,
            },
            symbol_in_winbar = {
                enable = false,
            },
            lightbulb = {
                enable = false,
            },
            outline = {
                layout = "float",
            },
        })
    end,
}

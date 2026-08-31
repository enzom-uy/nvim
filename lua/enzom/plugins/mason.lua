return {
    "mason-org/mason.nvim",

    dependencies = {
        "mason-org/mason-lspconfig.nvim",
    },

    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "bashls",
                "jsonls",
                "marksman",
                "tailwindcss",
                "prismals",
                "astro",
                "qmlls",
                "ts_ls",
                "intelephense",
            },

            automatic_enable = {
                exclude = {
                    -- "ts_ls",
                    "jdtls",
                },
            },
        })
    end,
}

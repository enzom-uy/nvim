return {
    "OlegGulevskyy/better-ts-errors.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = {
        keymaps = {
            toggle = "<leader>ts", -- default '<leader>dd'
            go_to_definition = "<leader>p", -- default '<leader>dx'
        },
    },
}

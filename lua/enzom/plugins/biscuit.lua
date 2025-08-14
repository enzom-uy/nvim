return {
    "code-biscuits/nvim-biscuits",
    version = "*",
    lazy = false,
    config = function()
        require("nvim-biscuits").setup({
            default_config = {
                max_length = 12,
                min_distance = 5,
                prefix_string = " 📎 "
            },
            on_events = { 'InsertLeave', 'CursorHoldI' },
            language_config = {
                html = {
                    prefix_string = " 🌐 "
                },
                javascript = {
                    prefix_string = " ✨ ",
                    max_length = 80
                },

                typescript = {
                    prefix_string = " ✨ ",
                    max_length = 80
                },
                python = {
                    disabled = true
                }
            }
        })
    end
}

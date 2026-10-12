return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        local optsWithoutDesc = { noremap = true, silent = true }
        local keymap = vim.keymap
        local opts = function(desc)
            return { noremap = true, silent = true, desc = desc }
        end

        harpoon:setup()

        keymap.set("n", "<leader>ha", function() harpoon:list():add() end, opts("Add harpoon"))
        keymap.set("n", "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            opts("Toggle harpoon quick menu"))
        keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, optsWithoutDesc)
        keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, optsWithoutDesc)
        keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, optsWithoutDesc)
        keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, optsWithoutDesc)
    end
}

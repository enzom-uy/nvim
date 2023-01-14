require("lspsaga").setup {
  ui = {
    theme = "round",
    border = "rounded",
    winblend = 20,
    colors = {
      --float window normal bakcground color
      normal_bg = "#000000",
      --title background color
      title_bg = "#000000",
    },
    expand = "",
    collapse = "",
    preview = " ",
    code_action = "💡",
    diagnostic = "",
    incoming = " ",
    outgoing = " ",
  },
}
local keymap = vim.keymap
keymap.set("n", "md", ":Lspsaga show_line_diagnostics<CR>")
keymap.set("n", "<S-j>", ":Lspsaga diagnostic_jump_next<CR>")

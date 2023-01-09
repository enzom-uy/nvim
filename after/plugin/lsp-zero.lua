local lsp = require "lsp-zero"

lsp.preset "recommended"

lsp.nvim_workspace()
lsp.set_preferences {
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = "local",
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
  },
}

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }
  local bind = vim.keymap.set

  bind("n", "<S-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  bind("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
  bind("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
  bind("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
  bind("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opts)
  bind("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
end)

lsp.ensure_installed {
  "tsserver",
  "eslint",
  "sumneko_lua",
  "marksman",
}

lsp.setup()

vim.diagnostic.config {
  virtual_text = true,
}

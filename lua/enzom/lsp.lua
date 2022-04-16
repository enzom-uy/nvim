local lspconfig = require("lspconfig")
local protocol = require("vim.lsp.protocol")
local util = require("lspconfig/util")

-- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  signs = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    prefix = " ",
  },
})

protocol.CompletionItemKind = {
  "", -- Text
  "", -- Method
  "", -- Function
  "", -- Constructor
  "", -- Field
  "", -- Variable
  "", -- Class
  "ﰮ", -- Interface
  "", -- Module
  "", -- Property
  "", -- Unit
  "", -- Value
  "", -- Enum
  "", -- Keyword
  "﬌", -- Snippet
  "", -- Color
  "", -- File
  "", -- Reference
  "", -- Folder
  "", -- EnumMember
  "", -- Constant
  "", -- Struct
  "", -- Event
  "ﬦ", -- Operator
  "", -- TypeParameter
}

-- Code action popup
-- but only use it if installed
local success_lsputils, lsputils_codeAction = pcall(require, "lsputil.codeAction")
if success_lsputils then
  if vim.fn.has("nvim-0.6") == 1 then
    vim.lsp.handlers["textDocument/codeAction"] = lsputils_codeAction.code_action_handler
  else
    vim.lsp.handlers["textDocument/codeAction"] = function(_, _, actions)
      lsputils_codeAction.code_action_handler(nil, actions, nil, nil, nil)
    end
  end
end

local function lsp_map(mode, left_side, right_side)
  vim.api.nvim_buf_set_keymap(vim.api.nvim_get_current_buf(), mode, left_side, right_side, { noremap = true })
end

local function on_attach(client)
  -- Formatting
  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Only load cmp lsp capabilities when avaiabled
-- in case you uninstall nvim-cmp
local success_cmp_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if success_cmp_lsp then
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

local lsp_installer = require("nvim-lsp-installer")
local servers = {
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  "eslint",
  "html",
  "jsonls",
  "tsserver",
  "sumneko_lua",
  "bashls",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      server:install()
    end
  end
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
    flags = {
      debounce_text_changes = 150,
    },
  })
end

lspconfig.emmet_ls.setup({
  cmd = { "emmet-ls", "--stdio" },
  filetypes = { "html", "css" },
  single_file_support = true,
})

lspconfig.tsserver.setup({
  capabilities = capabilities,
  init_options = {
    hostInfo = "neovim",
  },
  on_attach = on_attach,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
})

lspconfig.rust_analyzer.setup {}
lspconfig.golangci_lint_ls.setup {}
lspconfig.gopls.setup {
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

local lsp = require "lsp-zero"
local lspkind = require "lspkind"
local cmp = require "cmp"
local ls = require "luasnip"
local protocol = require "vim.lsp.protocol"

local function formatForTailwindCSS(entry, vim_item)
  if vim_item.kind == "Color" and entry.completion_item.documentation then
    local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
    if r then
      local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
      local group = "Tw_" .. color
      if vim.fn.hlID(group) < 1 then vim.api.nvim_set_hl(0, group, { fg = "#" .. color }) end
      vim_item.kind = "●"
      vim_item.kind_hl_group = group
      return vim_item
    end
  end
  vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
  return vim_item
end

lsp.preset "recommended"

lsp.set_preferences {
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = true,
  cmp_capabilities = false,
  manage_nvim_cmp = false,
  call_servers = "local",
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
  },
}

lsp.setup_nvim_cmp {
  snippet = {
    expand = function(args) require("luasnip").lsp_expand(args.body) end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<C-l>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif ls.jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end,
  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
  formatting = {
    format = lspkind.cmp_format {
      maxwidth = 50,
      mode = "symbol_text",
      before = function(entry, vim_item)
        vim_item = formatForTailwindCSS(entry, vim_item)
        return vim_item
      end,
    },
  },
}

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

lsp.on_attach(function()
  local diagnostic = require "lspsaga.diagnostic"
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<S-j>", diagnostic.goto_next, opts)
  vim.keymap.set("n", "gl", diagnostic.show_diagnostics, opts)
  vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
  vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
  -- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
  vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
  vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)

  -- code action
  local codeaction = require "lspsaga.codeaction"
  vim.keymap.set("n", "<leader>af", function() codeaction:code_action() end, { silent = true })
  vim.keymap.set("v", "<leader>af", function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
    codeaction:range_code_action()
  end, { silent = true })
end)

lsp.ensure_installed {
  "tsserver",
  "eslint",
  "sumneko_lua",
  "marksman",
}

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config {
  virtual_text = {
    prefix = "●",
  },
  update_in_insert = false,
  float = {
    source = "always", -- Or "if_many"
  },
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

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

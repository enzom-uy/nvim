local lsp = require "lsp-zero"
local lspkind = require "lspkind"
local cmp = require "cmp"
local ls = require "luasnip"

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
  formatting = {
    format = lspkind.cmp_format {
      maxwidth = 50,
      before = function(entry, vim_item)
        vim_item = formatForTailwindCSS(entry, vim_item)
        return vim_item
      end,
    },
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

vim.diagnostic.config {
  virtual_text = true,
}
lsp.setup()

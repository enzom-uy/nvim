-- luasnip setup
local ls = require("luasnip")
local lspconfig = require("lspconfig")
local lspkind = require('lspkind')
local tabnine = require("cmp_tabnine.config")


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
  "pyright",
  "tsserver",
  "cssls",
  "eslint",
  "html",
  "cssmodules_ls",
  "jsonls",
  "emmet_ls",
  "sumneko_lua",
  "gopls",
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup {
  sorting = {
    comparators = {
      cmp.config.compare.recently_used,
      cmp.config.compare.offset,
      cmp.config.compare.score,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  preselect = cmp.PreselectMode.Item,
  style = {
    winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
  },
  window = {
    completion = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      scrollbar = "║",
      autocomplete = {
        require("cmp.types").cmp.TriggerEvent.InsertEnter,
        require("cmp.types").cmp.TriggerEvent.TextChanged,
      },
    },
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      scrollbar = "║",
    },
  },
  sources = {
    { name = "copilot", group_index = 2 },
    { name = "nvim_lsp", group_index = 2 },
    { name = "buffer", group_index = 2 },
    { name = "cmp_tabnine", group_index = 2 },
  },
  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        copilot = "[Copilot]",
        cmp_tabnine = "[TabNine]"
      })[entry.source.name]
      return vim_item
    end
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  enabled = function()
    -- disable completion in comments
    local context = require("cmp.config.context")
    return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
  end,
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-l>"] = cmp.mapping.complete({
      config = {
        sources = {
          { name = 'copilot' }
        }
      }
    }),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) > 0 then
        -- handle vsnip
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
  experimental = {
    ghost_text = false,
  },
}



lspconfig['gopls'].setup {
  cmd = { 'gopls' },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  }
}

tabnine:setup({
  max_lines = 1000,
  max_num_results = 5,
  sort = true,
  run_on_every_keystroke = true,
  snippet_placeholder = "..",
  ignored_file_types = {
    TelescopePrompt = true,
  },
})

--set max height of items
vim.cmd([[ set pumheight=10 ]])
--set highlights
local highlights = {
  CmpItemKindText = { fg = "#ebdbb2" },
  CmpItemKindFunction = { fg = "#C586C0" },
  CmpItemKindClass = { fg = "#fe8019" },
  CmpItemKindKeyword = { fg = "#d3869b" },
  CmpItemMenu = { fg = "NONE", bg = "NONE" },
  CmpItemKindSnippet = { fg = "#ebdbb2" },
  CmpItemKindConstructor = { fg = "#fbf1c7" },
  CmpItemKindVariable = { fg = "#83a598", bg = "NONE" },
  CmpItemKindInterface = { fg = "#b16286", bg = "NONE" },
  CmpItemKindFolder = { fg = "#ebdbb2" },
  CmpItemKindReference = { fg = "#cc241d" },
  CmpItemKindMethod = { fg = "#b16286" },
  -- CmpItemMenu = { fg = "#C586C0", bg = "#C586C0" },
  CmpItemAbbr = { fg = "#ebdbb2", bg = "NONE" },
  CmpItemAbbrMatch = { fg = "#b8bb26", bg = "NONE" },
  CmpItemAbbrMatchFuzzy = { fg = "#b8bb26", bg = "NONE" },
}

vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = "#000000", bg = "#000000"})
for group, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, hl)
end

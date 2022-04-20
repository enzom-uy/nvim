-- luasnip setup
local ls = require("luasnip")
local tabnine = require("cmp_tabnine.config")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local cmp = require("cmp")
cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp", group_index = 2 },
    { name = "buffer", group_index = 2 },
    { name = "cmp_tabnine", group_index = 2 },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        cmp_tabnine = "[TabNine]"
      })[entry.source.name]
      return vim_item
    end
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-l>"] = cmp.mapping.complete({}),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
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
  enabled = function()
    -- disable completion in comments
    local context = require("cmp.config.context")
    return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
  end,
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

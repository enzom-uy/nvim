local ls = require("luasnip")
local tabnine = require("cmp_tabnine.config")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

vim.cmd([[
  autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
  ]])
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	style = {
		winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
	},
	window = {
		completion = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			scrollbar = "║",
			winhighlight = "Normal:CmpMenu,FloatBorder:CmpMenuBorder,CursorLine:CmpSelection,Search:None",
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
		{ name = "nvim_lsp", group_index = 2 },
		-- { name = "copilot", group_index = 2 },
		{ name = "cmp_tabnine", group_index = 2 },
		{ name = "buffer", group_index = 2 },
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				-- copilot = "[Copilot]",
				cmp_tabnine = "[TabNine]",
				buffer = "[Buffer]",
			})[entry.source.name]
			return vim_item
		end,
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
})

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

local highlights = {
	-- type highlights
	CmpItemKindText = { fg = "LightGrey" },
	CmpItemKindClass = { fg = "Orange" },
	CmpItemKindSnippet = { fg = "#565c64" },
	CmpItemKindVariable = { fg = "#9CDCFE", bg = "NONE" },
	CmpItemKindFolder = { fg = "#2986cc" },
	CmpItemKindReference = { fg = "#922b21" },
	CmpItemAbbr = { fg = "#565c64", bg = "NONE" },
	CmpItemAbbrMatch = { fg = "#569CD6", bg = "NONE" },
	CmpItemAbbrMatchFuzzy = { fg = "#569CD6", bg = "NONE" },
	CmpMenuBorder = { fg = "#FFFFFF" },
	CmpMenu = { bg = "NONE" },
	CmpSelection = { bg = "#263341" },
}
-- vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = "#565c64" })
for group, hl in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, hl)
end

local lsp_zero = require("lsp-zero")
local lspkind = require("lspkind")
local saga = require("lspsaga")

-- code action
vim.keymap.set("n", ";af", "<cmd>Lspsaga code_action<CR>")

local lsp_attach = function(client, bufnr)
	local opts = { buffer = bufnr, noremap = true, silent = true }

	vim.keymap.set("n", "<S-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	vim.keymap.set("n", "md", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
	vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
	vim.keymap.set("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>", opts)
	vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

saga.setup({
	ui = {
		border = "rounded",
	},
	symbol_in_winbar = {
		enable = false,
	},
	lightbulb = {
		enable = false,
	},
	outline = {
		layout = "float",
	},
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"marksman",
		"lua_ls",
		"prismals",
		"tailwindcss",
		"astro",
		"cssls",
		"cssmodules_ls",
		"html",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	window = {
		documentation = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
		},
	},
	sources = {
		{
			name = "nvim_lsp",
			entry_filter = function(entry, ctx)
				local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
				if kind == "Snippet" and ctx.prev_context.filetype == "java" then
					return false
				end

				if ctx.prev_context.filetype == "markdown" then
					return true
				end

				if kind == "Text" then
					return false
				end

				return true
			end,
		},
		{ name = "nvim_lua" },
	},
	snippet = {
		expand = function(args)
			-- You need Neovim v0.10 to use vim.snippet
			vim.snippet.expand(args.body)
		end,
	},

	formatting = {
		lsp_zero.cmp_format(),
		format = lspkind.cmp_format({
			mode = "symbol",
			preset = "default",
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
		["<Enter>"] = cmp.mapping.confirm({ select = true }),
		["<C-l>"] = cmp.mapping.complete(),
		["<C-space>"] = cmp.mapping.complete(),
	}),
})

require("mason").setup()

local servers = {
	-- "tsserver",
	"lua_ls",
	"html",
	"cssls",
	"bashls",
	"jsonls",
	"marksman",
	"tailwindcss",
	"prismals",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
	window = {
		documentation = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
		},
	},

	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
		["<Enter>"] = cmp.mapping.confirm({ select = true }),
		["<C-l>"] = cmp.mapping.complete(),
		["<C-space>"] = cmp.mapping.complete(),
	}),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
	}),

	formatting = {
		format = lspkind.cmp_format({
			mode = "text_symbol",
			preset = "default",
		}),
	},
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_attach = function(client, bufnr)
	local opts = { buffer = bufnr, noremap = true, silent = true }

	vim.keymap.set("n", "<S-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	vim.keymap.set("n", "md", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
	vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
	vim.keymap.set("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>", opts)
	vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set("n", "<leader>gr", "<Cmd>Lspsaga rename<CR>", opts)
end

for _, server in ipairs(servers) do
	require("lspconfig")[server].setup({
		capabilities = capabilities,
		on_attach = lsp_attach,
	})
end

local saga = require("lspsaga")

-- code action
vim.keymap.set("n", ";af", "<cmd>Lspsaga code_action<CR>")

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

require("lspkind").init({
	-- DEPRECATED (use mode instead): enables text annotations
	--
	-- default: true
	-- with_text = true,

	-- defines how annotations are shown
	-- default: symbol
	-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
	mode = "symbol_text",

	-- default symbol map
	-- can be either 'default' (requires nerd-fonts font) or
	-- 'codicons' for codicon preset (requires vscode-codicons font)
	--
	-- default: 'default'
	preset = "codicons",

	symbol_map = {
		Text = "󰉿",
		Method = "󰆧",
		Function = "󰊕",
		Constructor = "",
		Field = "󰜢",
		Variable = "󰀫",
		Class = "󰠱",
		Interface = "",
		Module = "",
		Property = "󰜢",
		Unit = "󰑭",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "󰈇",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "󰙅",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "",
	},
})

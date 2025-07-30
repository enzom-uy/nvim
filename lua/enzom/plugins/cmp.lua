return {
	"hrsh7th/nvim-cmp",
	event = "BufEnter",
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"nvimdev/lspsaga.nvim",
	},
	config = function()
		local lspkind = require("lspkind")
		local cmp = require("cmp")

		local buftype = vim.api.nvim_buf_get_option(0, "buftype")
		if buftype == "prompt" then
			return false
		end

		local servers = {
			-- "tsserver",
			"lua_ls",
			"html",
			"bashls",
			"jsonls",
			"marksman",
			"tailwindcss",
			"prismals",
			-- "ts_ls",
			"eslint",
		}

		cmp.setup({
			window = {
				documentation = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
				},
			},

			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
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
			vim.keymap.set("n", "md", ":lua vim.diagnostic.open_float()<CR>", opts)
			vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
			vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
			vim.keymap.set("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>", opts)
			vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
			vim.keymap.set("n", "<leader>gr", "<Cmd>Lspsaga rename<CR>", opts)
			vim.keymap.set("n", "<leader>af", ":lua vim.lsp.buf.code_action()<CR>")
		end

		for _, server in ipairs(servers) do
			require("lspconfig")[server].setup({
				capabilities = capabilities,
				on_attach = lsp_attach,
			})
		end

		local saga = require("lspsaga")

		-- code action

		saga.setup({
			ui = {
				border = "rounded",
				height = 30,
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
		local lspconfig = require("lspconfig")

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
	end,
}

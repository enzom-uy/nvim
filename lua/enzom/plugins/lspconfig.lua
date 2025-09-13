return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp", "nvimdev/lspsaga.nvim" },

	-- example using `opts` for defining servers
	opts = {
		servers = {
			lua_ls = {},
			astro = {},
			ts_ls = {},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			-- passing config.capabilities to blink.cmp merges with the capabilities in your
			-- `opts[server].capabilities, if you've defined it
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end

		local optsWithoutDescription = { buffer = bufnr, noremap = true, silent = true }
		local optsWithDescription = function(desc)
			return vim.tbl_extend("force", optsWithoutDescription, { desc = desc })
		end

		vim.keymap.set("n", "<S-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", optsWithDescription("Next diagnostic"))
		vim.keymap.set("n", "md", ":lua vim.diagnostic.open_float()<CR>", optsWithDescription("Show line diagnostics"))
		vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", optsWithDescription("Show hover doc"))
		vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", optsWithDescription("Goto definition"))
		vim.keymap.set("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>", optsWithDescription("Goto type definition"))
		vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", optsWithDescription("Peek definition"))
		vim.keymap.set("n", "<leader>gr", "<Cmd>Lspsaga rename<CR>", optsWithDescription("Rename"))
		vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", optsWithDescription("Code action"))

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
	end,
}

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason_lsp = require("mason-lspconfig")
		require("mason").setup()

		local servers = {
			-- "tsserver",
			"lua_ls",
			"bashls",
			"jsonls",
			"marksman",
			"tailwindcss",
			"prismals",
			"astro",

			-- managed by typescript-tools
			"ts_ls",
			"intelephense",
		}

		mason_lsp.setup({
			ensure_installed = servers,
			automatic_installation = true,
			automatic_enable = {
				exclude = {
					-- "ts_ls",
					"jdtls",
				},
			},
		})
	end,
}

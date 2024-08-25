return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
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
	end,
}

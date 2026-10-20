return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				prisma = { "prettier" },
				astro = { "prettier" },
				php = { "php-cs-fixer" },
				go = { "gofmt" },
				sql = { "sql_formatter" },
			},
			format_on_save = {
				timeout_ms = 300,
				lsp_format = true,
			},
		})
	end,
}

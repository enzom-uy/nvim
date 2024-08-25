return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	event = "BufEnter",
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		null_ls.setup({
			sources = {
				formatting.markdownlint,
				formatting.prettierd.with({
					filetypes = {
						"typescriptreact",
						"astro",
						"javascript",
						"javascriptreact",
						"json",
						"typescript",
						"prisma",
						"jsonc",
						"css",
						"markdown",
					},
				}),
				formatting.stylua,
				formatting.markdownlint,
				require("none-ls.diagnostics.eslint_d"),
			},
			-- configure format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									-- only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			group = vim.api.nvim_create_augroup("RestartPrettierd", { clear = true }),
			pattern = "*prettier*",
			callback = function()
				vim.fn.system("prettierd restart")
			end,
		})
	end,
}

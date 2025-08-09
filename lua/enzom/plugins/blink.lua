return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
	},
	{

		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets", "onsails/lspkind.nvim", "giuxtaposition/blink-cmp-copilot" },

		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			enabled = function()
				local disabled_filetypes = { "DressingInput", "AvanteInput" }
				return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
			end,
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				documentation = { auto_show = true },
				menu = {

					draw = {
						components = {
							kind_icon = {
								text = function(ctx)
									if ctx.source_name == "copilot" then
										return "" .. ctx.icon_gap
									end
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											icon = dev_icon
										end
									else
										icon = require("lspkind").symbolic(ctx.kind, {
											mode = "symbol",
										})
									end

									return icon .. ctx.icon_gap
								end,

								-- Optionally, use the highlight groups from nvim-web-devicons
								-- You can also add the same function for `kind.highlight` if you want to
								-- keep the highlight groups in sync with the icons.
								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							},
						},
					},
				},
			},

			sources = {
				default = { "copilot", "lsp", "path", "buffer", "snippets" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						async = true,
						transform_items = function(_, items)
							for _, item in ipairs(items) do
								item.kind_icon = ""
								item.kind_name = "Copilot"
							end
							return items
						end,
					},
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}

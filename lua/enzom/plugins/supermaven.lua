return {
	"supermaven-inc/supermaven-nvim",
	event = "InsertEnter",
	enabled = true,
	cmd = {
		"SupermavenUseFree",
	},
	opts = {
		keymaps = {
			accept_suggestion = nil, -- handled by nvim-cmp / blink.cmp
		},
		disable_inline_completion = vim.g.ai_cmp,
		ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
	},
}

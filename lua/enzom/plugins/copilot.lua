return {
	{
		"zbirenbaum/copilot.lua",
		opts = {
			panel = { enabled = false },
			suggestion = { enabled = false },
		},
	},
	{
		"giuxtaposition/blink-cmp-copilot",
		dependencies = { "zbirenbaum/copilot.lua" },
	},
}

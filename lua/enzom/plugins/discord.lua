return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	opts = {
		log_level = vim.log.levels.TRACE,
		-- pipe_path = "/tmp/discord-ipc-0",
		text = {
			workspace = "",
			editing = function(opts)
				local extension = opts.filename:match("%.([^%.]+)$") or "file"
				return string.format("Editing a %s file", extension:upper())
			end,
		},
	},
}

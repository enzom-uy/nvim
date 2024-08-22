require("cord").setup({
	usercmds = true, -- Enable user commands
	log_level = "error", -- One of 'trace', 'debug', 'info', 'warn', 'error', 'off'
	timer = {
		interval = 1500, -- Interval between presence updates in milliseconds (min 500)
		reset_on_idle = false, -- Reset start timestamp on idle
		reset_on_change = false, -- Reset start timestamp on presence change
	},
	editor = {
		image = nil, -- Image ID or URL in case a custom client id is provided
		client = "neovim", -- vim, neovim, lunarvim, nvchad, astronvim or your application's client id
		tooltip = "🤓", -- Text to display when hovering over the editor's image
	},
	display = {
		show_time = true, -- Display start timestamp
		show_repository = false, -- Display 'View repository' button linked to repository url, if any
		show_cursor_position = false, -- Display line and column number of cursor's position
		swap_fields = false, -- If enabled, workspace is displayed first
		swap_icons = false, -- If enabled, editor is displayed on the main image
		workspace_blacklist = {}, -- List of workspace names to hide
	},
	lsp = {
		show_problem_count = false, -- Display number of diagnostics problems
		severity = 1, -- 1 = Error, 2 = Warning, 3 = Info, 4 = Hint
		scope = "workspace", -- buffer or workspace
	},
	idle = {
		enable = true, -- Enable idle status
		show_status = true, -- Display idle status, disable to hide the rich presence on idle
		timeout = 300000, -- Timeout in milliseconds after which the idle status is set, 0 to display immediately
		disable_on_focus = false, -- Do not display idle status when neovim is focused
		text = "Idle", -- Text to display when idle
		tooltip = "💤", -- Text to display when hovering over the idle image
	},
	text = {
		viewing = "Viewing", -- Text to display when viewing a readonly file
		editing = "Editing", -- Text to display when editing a file
		file_browser = "Browsing files", -- Text to display when browsing files (Empty string to disable)
		plugin_manager = "Managing plugins", -- Text to display when managing plugins (Empty string to disable)
		lsp_manager = "Configuring LSP", -- Text to display when managing LSP servers (Empty string to disable)
		vcs = "Committing changes", -- Text to display when using Git or Git-related plugin (Empty string to disable)
		workspace = "In workspace", -- Text to display when in a workspace (Empty string to disable)
	},
	buttons = {
		{
			label = "View Repository", -- Text displayed on the button
			url = "git", -- URL where the button leads to ('git' = automatically fetch Git repository URL)
		},
	},
	assets = nil, -- Custom file icons, see the wiki*
})

vim.opt.shortmess:append { s = true, I = true } -- disable startup message
astronvim.vim_opts(astronvim.user_plugin_opts("options", {
  opt = {
    fileencoding = "utf-8", -- File content encoding for the buffer
    encoding = "utf-8",

    number = true, -- Show numberline
    relativenumber = true, -- Show relative numberline

    title = true,
    autoindent = true,
    breakindent = true,
    smartindent = true,
    signcolumn = "yes", -- Always show the sign column

    backupskip = { "/tmp/*", "/private/tmp/*" },
    conceallevel = 2,
    backspace = { "start", "eol", "indent" }, -- Don't stop backspace at insert
    inccommand = "split",
    clipboard = "unnamedplus", -- Connection to the system clipboard
    cmdheight = 1, -- hide command line unless needed
    completeopt = { "menuone", "noselect" }, -- Options for insert mode completion
    cursorline = true, -- Highlight the text line of the cursor
    showcmd = true,
    expandtab = true, -- Enable the use of space in tab
    fillchars = { eob = " " }, -- Disable `~` on nonexistent lines
    history = 100, -- Number of commands to remember in a history table
    ignorecase = true, -- Case insensitive searching
    laststatus = 3, -- globalstatus
    shell = "zsh",
    undodir = vim.fn.stdpath("data") .. "/undodir",
    lazyredraw = true, -- lazily redraw screen
    mouse = "a", -- Enable mouse support
    pumheight = 10, -- Height of the pop up menu
    scrolloff = 10, -- Number of lines to keep above and below the cursor
    shiftwidth = 2, -- Number of space inserted for indentation
    tabstop = 2, -- Number of space in a tab
    showmode = true, -- Disable showing modes in command line
    showtabline = 2, -- always display tabline
    sidescrolloff = 8, -- Number of columns to keep at the sides of the cursor
    smartcase = true, -- Case sensitivie searching
    smarttab = true,
    splitbelow = true, -- Splitting a new window below the current one
    splitright = true, -- Splitting a new window at the right of the current one
    swapfile = false, -- Disable use of swapfile for the buffer
    termguicolors = true, -- Enable 24-bit RGB color in the TUI
    timeoutlen = 300, -- Length of time to wait for a mapped sequence
    undofile = true, -- Enable persistent undo
    updatetime = 300, -- Length of time to wait before triggering the plugin
    wrap = false, -- Disable wrapping of lines longer than the width of window
    writebackup = false, -- Disable making a backup before overwriting a file
    cc = "100"
  },
  g = {
    highlighturl_enabled = true, -- highlight URLs by default
    mapleader = ";", -- set leader key
    zipPlugin = false, -- disable zip
    load_black = false, -- disable black
    loaded_2html_plugin = true, -- disable 2html
    loaded_getscript = true, -- disable getscript
    loaded_getscriptPlugin = true, -- disable getscript
    loaded_gzip = true, -- disable gzip
    loaded_logipat = true, -- disable logipat
    loaded_matchit = true, -- disable matchit
    loaded_netrwFileHandlers = true, -- disable netrw
    loaded_netrwPlugin = true, -- disable netrw
    loaded_netrwSettngs = true, -- disable netrw
    loaded_remote_plugins = true, -- disable remote plugins
    loaded_tar = true, -- disable tar
    loaded_tarPlugin = true, -- disable tar
    loaded_zip = true, -- disable zip
    loaded_zipPlugin = true, -- disable zip
    loaded_vimball = true, -- disable vimball
    loaded_vimballPlugin = true, -- disable vimball
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_enabled = true, -- enable diagnostics at start
    status_diagnostics_enabled = true, -- enable diagnostics in statusline
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
  },
}))

local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

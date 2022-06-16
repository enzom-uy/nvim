local options = {
	errorbells = false,
	smartcase = true,
	showmatch = true,
	showmode = false,
  swapfile = false,
	backup = false,
	undodir = vim.fn.stdpath("data") .. "/undodir",
	undofile = true,
	incsearch = true,
	hlsearch = false,
	hidden = true,
	completeopt = "menuone,noinsert,noselect",
	autoindent = true,
	pumheight = 10,
	smartindent = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	signcolumn = "yes",
	wrap = false,
	cursorline = true,
	list = true,
	number = true,
	numberwidth = 2,
	scrolloff = 10,
	showtabline = 2,
	ttimeoutlen = 50,
	ignorecase = true,
	wildignorecase = true,
	smarttab = true,
	clipboard = "unnamedplus",
	mouse = "a",
	cc = "120",
	laststatus = 3,
	backspace = "indent,eol,start",
	lazyredraw = true,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

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


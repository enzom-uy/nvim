vim.cmd("augroup colorscheme_opts")
vim.cmd("au!")
--[[ vim.cmd("au ColorScheme * hi Normal guibg=NONE")
vim.cmd("au ColorScheme * hi ColorColumn guibg=#2c323c")
vim.cmd("au ColorScheme * hi CursorColumn guibg=NONE")
vim.cmd("au ColorScheme * hi NonText ctermbg=NONE")
vim.cmd("au ColorScheme * hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow") ]]
-- vim.cmd("au ColorScheme * hi Cursor guibg=black")
--[[ vim.cmd(
	"au ColorScheme * hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE"
) ]]
--[[ vim.cmd("au ColorScheme * hi SignColumn guibg=NONE")
vim.cmd("au ColorScheme * hi FloatBorder guifg=NONE")
vim.cmd("au ColorScheme * hi NormalFloat guifg=NONE guibg=NONE")
vim.cmd("au ColorScheme * hi FloatBorder guifg=#ffffff")
vim.cmd("au ColorScheme * hi Normal guibg=NONE")
vim.cmd("augroup END") ]]

vim.opt.termguicolors = true
vim.opt.relativenumber = true

-- Safely call command to set colorscheme
-- but do not stop execution
local colorscheme_cmd = "colorscheme tokyodark"
local success, err = pcall(vim.cmd, colorscheme_cmd)

vim.o.background = "dark"

if not success then
  vim.api.nvim_err_writeln(err)
end

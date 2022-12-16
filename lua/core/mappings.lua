local is_available = astronvim.is_available

local maps = { i = {}, n = {}, v = {}, t = {}, [""] = {} }

maps[""]["<Space>"] = "<Nop>"

-- Normal --
-- Standard Operations
maps.n["q"] = { "<cmd>q<cr>", desc = "Quit" }
maps.n["<C-s>"] = { "<cmd>w<cr>", desc = "Force write" }

maps.n["<C-j>"] = { "<C-d>", desc = "Jump down" }
maps.n["<C-k>"] = { "<C-u>", desc = "Jump down" }

-- Alpha
if is_available "alpha-nvim" then
  maps.n["<leader>d"] = { function() require("alpha").start() end, desc = "Alpha Dashboard" }
end

-- Bufdelete
if is_available "bufdelete.nvim" then
  maps.n["<C-d>"] = { function() require("bufdelete").bufdelete(0, false) end, desc = "Close buffer" }
end

-- Navigate buffers
if is_available "bufferline.nvim" then
  maps.n["<Tab>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer tab" }
  maps.n["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer tab" }
end

-- Comment
if is_available "Comment.nvim" then
  maps.n["<leader>/"] = { function() require("Comment.api").toggle.linewise.current() end, desc = "Comment line" }
  maps.v["<leader>/"] = {
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    desc = "Toggle comment line",
  }
end

-- GitSigns
if is_available "gitsigns.nvim" then
  maps.n["<leader>gj"] = { function() require("gitsigns").next_hunk() end, desc = "Next git hunk" }
  maps.n["<leader>gk"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous git hunk" }
  maps.n["<leader>gl"] = { function() require("gitsigns").blame_line() end, desc = "View git blame" }
  maps.n["<leader>gp"] = { function() require("gitsigns").preview_hunk() end, desc = "Preview git hunk" }
  maps.n["<leader>gh"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset git hunk" }
  maps.n["<leader>gr"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset git buffer" }
  maps.n["<leader>gs"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage git hunk" }
  maps.n["<leader>gu"] = { function() require("gitsigns").undo_stage_hunk() end, desc = "Unstage git hunk" }
  maps.n["<leader>gd"] = { function() require("gitsigns").diffthis() end, desc = "View git diff" }
end

-- Neogit
maps.n["<leader>n"] = { "<cmd>Neogit<cr>", desc = "Toggle Neogit" }

-- Harpoon
maps.n["<leader>hh"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show Harpoon quick menu" }
maps.n["<leader>ha"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add new mark to Harpoon" }
maps.n["<A-h>"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Move to Harpoon 1" }
maps.n["<A-j>"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Move to Harpoon 2" }
maps.n["<A-k>"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Move to Harpoon 3" }
maps.n["<A-l>"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Move to Harpoon 4" }

-- NeoTree
if is_available "neo-tree.nvim" then
  maps.n["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" }
end

-- Session Manager
if is_available "neovim-session-manager" then
  maps.n["<leader>Sl"] = { "<cmd>SessionManager! load_last_session<cr>", desc = "Load last session" }
  maps.n["<leader>Ss"] = { "<cmd>SessionManager! save_current_session<cr>", desc = "Save this session" }
  maps.n["<leader>Sd"] = { "<cmd>SessionManager! delete_session<cr>", desc = "Delete session" }
  maps.n["<leader>Sf"] = { "<cmd>SessionManager! load_session<cr>", desc = "Search sessions" }
  maps.n["<leader>S."] =
  { "<cmd>SessionManager! load_current_dir_session<cr>", desc = "Load current directory session" }
end

-- Splits
maps.n["<leader>vs"] = { "<cmd>vsplit<cr>", desc = "Create vertical split" }
maps.n["<leader>hs"] = { "<cmd>split<cr>", desc = "Create horizontal split" }

-- Smart Splits
if is_available "smart-splits.nvim" then
  -- Better window navigation
  maps.n["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" }
  maps.n["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" }

  -- Resize with arrows
  maps.n["<C-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" }
  maps.n["<C-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" }
  maps.n["<C-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" }
  maps.n["<C-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" }
else
  maps.n["<C-h>"] = { "<C-w>h", desc = "Move to left split" }
  maps.n["<C-l>"] = { "<C-w>l", desc = "Move to right split" }
  maps.n["<C-Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" }
  maps.n["<C-Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" }
  maps.n["<C-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" }
  maps.n["<C-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" }
end

-- SymbolsOutline
if is_available "aerial.nvim" then
  maps.n["<leader>lS"] = { function() require("aerial").toggle() end, desc = "Symbols outline" }
end

-- Telescope
if is_available "telescope.nvim" then
  maps.n["<leader>gg"] = { function() require("telescope.builtin").live_grep() end, desc = "Search words" }
  maps.n["<leader>gt"] = { function() require("telescope.builtin").git_status() end, desc = "Git status" }
  maps.n["<leader>gb"] = { function() require("telescope.builtin").git_branches() end, desc = "Git branches" }
  maps.n["<leader>gc"] = { function() require("telescope.builtin").git_commits() end, desc = "Git commits" }
  maps.n["<leader>ff"] = { function() require("telescope.builtin").find_files { hidden = true } end,
    desc = "Search files" }
  maps.n["<leader>fF"] = {
    function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
    desc = "Search all files",
  }
  maps.n["<leader>fb"] = { function() require("telescope.builtin").buffers() end, desc = "Search buffers" }
  maps.n["<leader>fh"] = { function() require("telescope.builtin").help_tags() end, desc = "Search help" }
  maps.n["<leader>fm"] = { function() require("telescope.builtin").marks() end, desc = "Search marks" }
  maps.n["<leader>fo"] = { function() require("telescope.builtin").oldfiles() end, desc = "Search history" }
  maps.n["<leader>fc"] =
  { function() require("telescope.builtin").grep_string() end, desc = "Search for word under cursor" }
  maps.n["<leader>sb"] = { function() require("telescope.builtin").git_branches() end, desc = "Git branches" }
  maps.n["<leader>sh"] = { function() require("telescope.builtin").help_tags() end, desc = "Search help" }
  maps.n["<leader>sm"] = { function() require("telescope.builtin").man_pages() end, desc = "Search man" }
  maps.n["<leader>sr"] = { function() require("telescope.builtin").registers() end, desc = "Search registers" }
  maps.n["<leader>sk"] = { function() require("telescope.builtin").keymaps() end, desc = "Search keymaps" }
  maps.n["<leader>sc"] = { function() require("telescope.builtin").commands() end, desc = "Search commands" }
  if astronvim.is_available "nvim-notify" then
    maps.n["<leader>sn"] =
    { function() require("telescope").extensions.notify.notify() end, desc = "Search notifications" }
  end
  maps.n["<leader>ls"] = {
    function()
      local aerial_avail, _ = pcall(require, "aerial")
      if aerial_avail then
        require("telescope").extensions.aerial.aerial()
      else
        require("telescope.builtin").lsp_document_symbols()
      end
    end,
    desc = "Search symbols",
  }
  maps.n["<leader>lD"] = { function() require("telescope.builtin").diagnostics() end, desc = "Search diagnostics" }
end

-- Terminal
if is_available "toggleterm.nvim" then
  local toggle_term_cmd = astronvim.toggle_term_cmd
  if vim.fn.executable "lazygit" == 1 then
    maps.n["<leader>lg"] = { function() toggle_term_cmd "lazygit" end, desc = "ToggleTerm lazygit" }
  end
  maps.n["<A-/>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
end

if is_available "nvim-dap" then
  -- modified function keys found with `showkey -a` in the terminal to get key code
  -- run `nvim -V3log +quit` and search through the "Terminal info" in the `log` file for the correct keyname
  maps.n["<F5>"] = { function() require("dap").continue() end, desc = "Debugger: Start" }
  maps.n["<F17>"] = { function() require("dap").terminate() end, desc = "Debugger: Stop" } -- Shift+F5
  maps.n["<F29>"] = { function() require("dap").restart_frame() end, desc = "Debugger: Restart" } -- Control+F5
  maps.n["<F6>"] = { function() require("dap").pause() end, desc = "Debugger: Pause" }
  maps.n["<F9>"] = { function() require("dap").toggle_breakpoint() end, desc = "Debugger: Toggle Breakpoint" }
  maps.n["<F10>"] = { function() require("dap").step_over() end, desc = "Debugger: Step Over" }
  maps.n["<F11>"] = { function() require("dap").step_into() end, desc = "Debugger: Step Into" }
  maps.n["<F23>"] = { function() require("dap").step_out() end, desc = "Debugger: Step Out" } -- Shift+F11
  maps.n["<leader>Db"] = { function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint (F9)" }
  maps.n["<leader>DB"] = { function() require("dap").clear_breakpoints() end, desc = "Clear Breakpoints" }
  maps.n["<leader>Dc"] = { function() require("dap").continue() end, desc = "Start/Continue (F5)" }
  maps.n["<leader>Di"] = { function() require("dap").step_into() end, desc = "Step Into (F11)" }
  maps.n["<leader>Do"] = { function() require("dap").step_over() end, desc = "Step Over (F10)" }
  maps.n["<leader>DO"] = { function() require("dap").step_out() end, desc = "Step Out (S-F11)" }
  maps.n["<leader>Dq"] = { function() require("dap").close() end, desc = "Close Session" }
  maps.n["<leader>DQ"] = { function() require("dap").terminate() end, desc = "Terminate Session (S-F5)" }
  maps.n["<leader>Dp"] = { function() require("dap").pause() end, desc = "Pause (F6)" }
  maps.n["<leader>Dr"] = { function() require("dap").restart_frame() end, desc = "Restart (C-F5)" }
  maps.n["<leader>DR"] = { function() require("dap").repl.toggle() end, desc = "Toggle REPL" }
  if is_available "nvim-dap-ui" then
    maps.n["<leader>Du"] = { function() require("dapui").toggle() end, desc = "Toggle Debugger UI" }
    maps.n["<leader>Dh"] = { function() require("dap.ui.widgets").hover() end, desc = "Debugger Hover" }
  end
end

-- Stay in indent mode
maps.v["<"] = { "<gv", desc = "unindent line" }
maps.v[">"] = { ">gv", desc = "indent line" }

-- Improved Terminal Navigation
maps.t["<C-h>"] = { "<c-\\><c-n><c-w>h", desc = "Terminal left window navigation" }
maps.t["<C-j>"] = { "<c-\\><c-n><c-w>j", desc = "Terminal down window navigation" }
maps.t["<C-k>"] = { "<c-\\><c-n><c-w>k", desc = "Terminal up window navigation" }
maps.t["<C-l>"] = { "<c-\\><c-n><c-w>l", desc = "Terminal right window navigation" }

-- Custom menu for modification of the user experience
if is_available "nvim-autopairs" then
  maps.n["<leader>ua"] = { function() astronvim.ui.toggle_autopairs() end, desc = "Toggle autopairs" }
end
maps.n["<leader>ub"] = { function() astronvim.ui.toggle_background() end, desc = "Toggle background" }
if is_available "nvim-cmp" then
  maps.n["<leader>uc"] = { function() astronvim.ui.toggle_cmp() end, desc = "Toggle autocompletion" }
end
if is_available "nvim-colorizer.lua" then
  maps.n["<leader>uC"] = { "<cmd>ColorizerToggle<cr>", desc = "Toggle color highlight" }
end
maps.n["<leader>uS"] = { function() astronvim.ui.toggle_conceal() end, desc = "Toggle conceal" }
maps.n["<leader>ud"] = { function() astronvim.ui.toggle_diagnostics() end, desc = "Toggle diagnostics" }
maps.n["<leader>ug"] = { function() astronvim.ui.toggle_signcolumn() end, desc = "Toggle signcolumn" }
maps.n["<leader>ui"] = { function() astronvim.ui.set_indent() end, desc = "Change indent setting" }
maps.n["<leader>ul"] = { function() astronvim.ui.toggle_statusline() end, desc = "Toggle statusline" }
maps.n["<leader>un"] = { function() astronvim.ui.change_number() end, desc = "Change line numbering" }
maps.n["<leader>us"] = { function() astronvim.ui.toggle_spell() end, desc = "Toggle spellcheck" }
maps.n["<leader>up"] = { function() astronvim.ui.toggle_paste() end, desc = "Toggle paste mode" }
maps.n["<leader>ut"] = { function() astronvim.ui.toggle_tabline() end, desc = "Toggle tabline" }
maps.n["<leader>uu"] = { function() astronvim.ui.toggle_url_match() end, desc = "Toggle URL highlight" }
maps.n["<leader>uw"] = { function() astronvim.ui.toggle_wrap() end, desc = "Toggle wrap" }
maps.n["<leader>uy"] = { function() astronvim.ui.toggle_syntax() end, desc = "Toggle syntax highlight" }
maps.n["<leader>uN"] = { function() astronvim.ui.toggle_ui_notifications() end, desc = "Toggle UI notifications" }

astronvim.set_mappings(astronvim.user_plugin_opts("mappings", maps))

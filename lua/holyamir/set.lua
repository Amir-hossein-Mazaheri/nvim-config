vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Disable various command line messages
vim.opt.shortmess:append("WcC")

vim.o.guifont = "Oxygen Mono:h24"

vim.opt.foldmethod = 'expr'

vim.api.nvim_exec([[
  set foldexpr=nvim_treesitter#foldexpr()
]], true)

vim.api.nvim_exec([[
  set nofoldenable
]], true)

-- just disable nerdtree to be lunched when opening a directory via neovim
vim.g.NERDTreeHijackNetrw = 0

vim.g.NERDTreeFileLines = 1

vim.g.rainbow_active = 1

vim.g.minimap_width = 10
vim.g.minimap_auto_start = 1
vim.g.minimap_auto_start_win_enter = 1

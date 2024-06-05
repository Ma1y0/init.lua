local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if mixed case id included in the search, assumes you want case-sensitive

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- color schemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfiles
opt.swapfile = false

-- scroll x lines before cursor
vim.opt.scrolloff = 10

-- alias :W -> :w
vim.cmd([[cabbrev W w]])

-- cmp
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- nerd font
vim.g.have_nerd_font = true

-- mouse mode
vim.opt.mouse = "a"

-- safe undo history
vim.opt.undofile = true

-- Decrease update time
vim.opt.updatetime = 250

-- Spell check
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Folds
vim.opt.foldmethod = "marker"

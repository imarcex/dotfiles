local g = vim.g
local o = vim.o

-- Colors
o.termguicolors = true
o.background = 'dark'

-- Tabs
o.tabstop = 4
o.shiftwidth = 0
o.softtabstop = -1 -- If negative, shiftwidth is used
o.shiftwidth = 0
o.expandtab = true
o.wrap = true
o.textwidth = 300

-- Line numbers/blocks
o.number = true
o.relativenumber = true
o.cursorline = true

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
o.jumpoptions = 'view'

-- Map <leader>
g.mapleader = " "
g.maplocalleader = " "

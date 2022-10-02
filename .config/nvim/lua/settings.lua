--------------
-- Settings --
--------------
local g = vim.g
local o = vim.o
local A = vim.api
local opt = vim.opt

------------------
-- Color Scheme --
------------------
--o.termguicolor = true
g.catppuccin_flavor = "macchiato" --latte, frappe, macchiato, mocha
vim.cmd [[colorscheme catppuccin]]

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 4

--Other Settings
o.number = true
o.numberwidth = 5
o.relativenumber = true
o.cursorline = true
o.expandtab = true
o.cindent = true
o.wrap = true
o.tabstop = 4
o.shiftwidth = 0
o.softtabstop = -1 --If negative, shiftwidth value is used
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

--Remember 50 last cmds in cmd line
o.history = 50

--Clipboard and mouse support
o.clipboard = 'unnamedplus'
opt.mouse = "a"

--Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false



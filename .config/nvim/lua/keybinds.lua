----------------------------------------------------
-- Define keymaps of Neovim and installed plugins --
----------------------------------------------------
local g = vim.g

--Map <leader> to comma
g.mapleader = ','
g.maplocalleader = ','

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')
map('i', '<leader>s', '<C-c>:w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

----------------------------------------
-- Applications and Plugins shortcuts --
----------------------------------------

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file


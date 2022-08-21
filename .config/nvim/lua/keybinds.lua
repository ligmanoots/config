----------------------------------------------------
-- Define keymaps of Neovim and installed plugins --
----------------------------------------------------
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local g = vim.g
local o = vim.opt

g.mapleader = ','

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
o.pastetoggle = '<F2>'

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')
map('i', '<leader>s', '<C-c>:w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':q!<CR>')

----------------------------------------
-- Applications and Plugins shortcuts --
----------------------------------------

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh

-- Telescope
-- Fuzzy find
map('n', '<C-P>', '<CMD>lua Telescope.find_files({ hidden = true })<CR>')

-- Get :help at the speed of light
map('n', '<leader>H', '<CMD>lua Telescope.help_tags()<CR>')

-- Fuzzy find active buffers
map('n', "'b", '<CMD>lua Telescope.buffers()<CR>')

-- Search for string
map('n', "'r", '<CMD>lua Telescope.live_grep()<CR>')

-- Fuzzy find changed files in git
map('n', "'c", '<CMD>lua Telescope.git_status()<CR>')






require('settings')
require('keybinds')
require('autocmds')
require('packer_plugins')

--For lsp
require('plugins.nvim-lspconfig')
require('plugins.nvim-cmp')

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end





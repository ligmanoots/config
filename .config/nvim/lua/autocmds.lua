------------------
-- Autocommands --
------------------

local A = vim.api


local num_au = A.nvim_create_augroup('DOOM', { clear = true })

--Open help vertically and press q to exit
A.nvim_create_autocmd('BufEnter', {
    group = num_au,
    pattern = '*.txt',
    callback = function()
        if vim.bo.buftype == 'help' then
            A.nvim_cmd({ cmd = 'wincmd', args = { 'L' } }, {})
            vim.keymap.set('n', 'q', '<CMD>q<CR>', { buffer = 0 })
        end
    end,
})

--Highlight yank region
A.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})




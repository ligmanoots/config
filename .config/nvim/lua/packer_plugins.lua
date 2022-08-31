-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-------------
-- Plugins --
-------------
return packer.startup(function(use)
	---------------------
    -- Package Manager --
    ---------------------
    use('wbthomason/packer.nvim')

	use('nvim-lua/plenary.nvim')
        
    ----------------------------------------
    -- Theme, Icons, Statusbar, Bufferbar --
    ----------------------------------------
	use({
        'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup()
        end,
    })

    use{'catppuccin/nvim', as = "catppuccin"}

	use({
        'nvim-lualine/lualine.nvim',
        config = function()
            require('plugins.lualine')
        end,
    })

	-----------------------------------
    -- Treesitter: Better Highlights --
    -----------------------------------
	use({
        {
        'nvim-treesitter/nvim-treesitter',
        event = 'CursorHold',
        run = ':TSUpdate',
        config = function()
            require('plugins.treesitter')
        end,
        },
        { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
        { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
        { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
        { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
        { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
    })

	-----------------------------------
    -- LSP, Completions and Snippets --
    -----------------------------------
    use { 'williamboman/nvim-lsp-installer' }

    use { 'neovim/nvim-lspconfig' }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
        },
    }

    ------------------
    -- Fuzzy Search --
    ------------------
    use({
        'kyazdani42/nvim-tree.lua',
        event = 'CursorHold',
        config = function()
            require('plugins.nvim-tree')
        end,
    })

    use({
        {
        'nvim-telescope/telescope.nvim',
        event = 'CursorHold',
        config = function()
            require('plugins.telescope')
        end,
        },
        {
        'nvim-telescope/telescope-fzf-native.nvim',
        after = 'telescope.nvim',
        run = 'make',
        config = function()
            require('telescope').load_extension('fzf')
        end,
        },
        {
            'nvim-telescope/telescope-symbols.nvim',
            after = 'telescope.nvim',
        },
    })

    use({
        'karb94/neoscroll.nvim',
        event = 'WinScrolled',
        config = function()
            require('neoscroll').setup({ hide_cursor = false })
        end,
    })

	---------------
    -- Editor UI --
    ---------------
	use ({
        'lewis6991/gitsigns.nvim',
    	requires = { 'nvim-lua/plenary.nvim' },
    	config = function()
    	    require('gitsigns').setup{}
    	end,
  	})

  	-- Dashboard (start screen)
  	use ({
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('plugins.alpha-nvim')
        end,
  	})

	-------------------------
    -- Editing to the MOON --
    -------------------------
	use ({'lukas-reineke/indent-blankline.nvim'})
	
    use ({
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup{}
        end,
    })

	-- Automatically set up your configuration after cloning packer.nvim
  	-- Put this at the end after all plugins
  	if packer_bootstrap then
    	require('packer').sync()
  	end
end)

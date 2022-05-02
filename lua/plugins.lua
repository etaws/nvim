return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'glepnir/zephyr-nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'folke/tokyonight.nvim'
    use 'sainnhe/edge'
    use 'Mofiqul/vscode.nvim'
    use 'tjdevries/colorbuddy.vim'
    use 'Th3Whit3Wolf/onebuddy'

    use 'kyazdani42/nvim-web-devicons'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- bufferline
    use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use {
        'lewis6991/gitsigns.nvim',
    }

    use {
        'SmiteshP/nvim-gps',
        requires = 'nvim-treesitter/nvim-treesitter'
    }

    use { 'akinsho/toggleterm.nvim' }

    use { 'ethanholz/nvim-lastplace' }

    use { 'lukas-reineke/indent-blankline.nvim' }

    use { 'neovim/nvim-lspconfig' }
    use { 'tami5/lspsaga.nvim' }

    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/vim-vsnip' }

    use { 'mfussenegger/nvim-lint' }

    -- use {'sbdchd/neoformat'}
    use { 'folke/which-key.nvim' }

    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'ellisonleao/glow.nvim', branch = 'main' }

    use { 'simrat39/symbols-outline.nvim' }

    use { 'luukvbaal/nnn.nvim' }
    use { 'j-hui/fidget.nvim' }
    use { 'windwp/nvim-spectre' }
end)

return require('packer').startup({
    function()
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        use 'glepnir/zephyr-nvim'
        use 'folke/tokyonight.nvim'
        use 'sainnhe/edge'

        use {
            'kyazdani42/nvim-web-devicons',
        }

        use {
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons', -- optional, for file icon
            },
            config = function() require'nvim-tree'.setup {} end
        }

        use {
            "nvim-lualine/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons"}
        }

        -- bufferline
        use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

        -- treesitter
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

        use {
            'lewis6991/gitsigns.nvim',
        }

        use {
            "SmiteshP/nvim-gps",
            requires = "nvim-treesitter/nvim-treesitter"
        }

        use {"akinsho/toggleterm.nvim"}


        use {"folke/which-key.nvim"}

        use { "ethanholz/nvim-lastplace"}

        use { "lukas-reineke/indent-blankline.nvim"}

        use { "neovim/nvim-lspconfig"}

        use { "hrsh7th/nvim-cmp"}
        use { "hrsh7th/cmp-nvim-lsp"}
        use { "hrsh7th/cmp-vsnip"}
        use { "hrsh7th/cmp-path"}
        use { "hrsh7th/cmp-buffer"}
        use { "hrsh7th/vim-vsnip"}

    end,
    config = {
        max_jobs = 16
    }
})

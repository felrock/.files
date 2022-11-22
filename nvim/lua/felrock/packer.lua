-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Style
    use 'gruvbox-community/gruvbox'
    use 'ayu-theme/ayu-vim'
    use 'altercation/vim-colors-solarized'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- File find
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-project.nvim'

    -- LSP
    use 'williamboman/nvim-lsp-installer'
    use 'neovim/nvim-lspconfig'
    use 'nvim-treesitter/nvim-treesitter'
    use 'hrsh7th/nvim-cmp'
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-cmdline"

    -- Diagnostics
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use 'preservim/nerdtree'
    -- use 'tiagofumo/vim-nerdtree-syntax-highlight'
    use 'ryanoasis/vim-devicons'

    -- Navigation
    use 'ThePrimeagen/harpoon'

    -- Floatterm
    use 'voldikss/vim-floaterm'

    -- Git
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'shumphrey/fugitive-gitlab.vim'
    -- use 'airblade/vim-gitgutter'

    use "sheerun/vim-polyglot" -- Indentation
    use 'tpope/vim-eunuch' -- Shell commands
    use 'tpope/vim-commentary' -- Comments
    use 'tpope/vim-surround' -- Surround words***
    use 'vim-utils/vim-man' -- Manual
    use 'vimwiki/vimwiki' -- Notes
    use 'tomtom/tlib_vim' -- Utility functions, dependancy
    use 'MarcWeber/vim-addon-mw-utils' -- Dependancy?
    use 'wellle/targets.vim' -- Extended targets***, like "ci"
end)

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Style
    use 'gruvbox-community/gruvbox'

    -- File find
    use 'nvim-lua/plenary.nvim'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- LSP
    use 'williamboman/nvim-lsp-installer'
    use 'neovim/nvim-lspconfig'
    use "hrsh7th/cmp-nvim-lsp"
    use 'hrsh7th/nvim-cmp'
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-cmdline"

    -- Floatterm
    use 'voldikss/vim-floaterm'

    -- Git
    use 'tpope/vim-fugitive'

    -- NerdTree
    use 'preservim/nerdtree'
end)

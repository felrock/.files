-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
    -- Style
    use "luisiacc/gruvbox-baby"
    use 'folke/tokyonight.nvim'
    use "gruvbox-community/gruvbox"
    use "tpope/vim-surround"

    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- File find
    use "nvim-lua/plenary.nvim"
    use {
      "nvim-telescope/telescope.nvim", tag = "0.1.4",
    -- or                            , branch = "0.1.x",
      requires = { {"nvim-lua/plenary.nvim"} }
    }

    -- LSP
    use "neovim/nvim-lspconfig"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/nvim-cmp"
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-cmdline"

    -- Floatterm
    use "voldikss/vim-floaterm"

    -- Git
    use "tpope/vim-fugitive"

    -- NerdTree
    use "preservim/nerdtree"

    -- CoPilot cmp
    -- use { "zbirenbaum/copilot.lua" }
    -- use {
    --    "zbirenbaum/copilot-cmp",
    --    after = { "copilot.lua" },
    --    config = function ()
    --    require("copilot_cmp").setup()
    --    end
    --}

    -- Markdown
    use "ellisonleao/glow.nvim"
    use "artempyanykh/marksman"

    -- Tree sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }
end)

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- for fuzzy finding files
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- onedark theme
    use "joshdick/onedark.vim"

    -- for super fast syntax highlighting
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- a super nice plugin for jumping between your marked files
    use('theprimeagen/harpoon')

    -- for undoing for multiple times and also giving you the tree with branches
    use('mbbill/undotree')

    -- for git integration
    use('tpope/vim-fugitive')

    -- next two are for lsp integration and autocompletion
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            -- {'williamboman/mason.nvim'},
            -- {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- all of these are for prettier to work
    use 'sbdchd/neoformat'
    use 'MunifTanjim/prettier.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- auto close "", {}, [], and etc
    use 'jiangmiao/auto-pairs'

    -- both for react snippets to work
    use 'SirVer/ultisnips'
    use 'mlaursen/vim-react-snippets'

    use 'preservim/nerdtree'

    -- for auto closing and renaming html tags in html and react
    use 'windwp/nvim-ts-autotag'

    use 'SirVer/ultisnips'

    use 'mlaursen/vim-react-snippets'

    use 'preservim/nerdtree'

    use 'windwp/nvim-ts-autotag'

    -- just a package for showing issues with the project that mostly cautch by lsp servers
    use "folke/trouble.nvim"
end)

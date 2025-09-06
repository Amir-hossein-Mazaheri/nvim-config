-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- for fuzzy finding files
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use {
        'nvim-telescope/telescope-file-browser.nvim',
        requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
    }

    -- Modern database integration for neovim
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'kristijanhusak/vim-dadbod-completion'

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
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' }
        }
    }
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- For enabling emmet abrevation in html and jsx
    use 'aca/emmet-ls'

    -- all of these are for prettier to work
    use 'sbdchd/neoformat'
    use 'MunifTanjim/prettier.nvim'
    use {
        "nvimtools/none-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }


    -- auto close "", {}, [], and etc
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    -- to change the surrounding of a text
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'

    -- both for react snippets to work
    use 'SirVer/ultisnips'
    use 'mlaursen/vim-react-snippets'

    -- buffer line for tabing
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

    -- netrw replacement
    use({
        "stevearc/oil.nvim",
    })

    -- for auto closing and renaming html tags in html and react
    use 'windwp/nvim-ts-autotag'

    -- just a package for showing issues with the project that mostly cautch by lsp servers
    use {
        "folke/trouble.nvim",
        requires = { "nvim-tree/nvim-web-devicons" }
    }

    -- just some random plugin to make the developer to only focus on code and hide everything else
    use {
        "folke/zen-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }

    -- wakatime integration
    use 'wakatime/vim-wakatime'

    -- for code outline
    use({
        "stevearc/aerial.nvim",
        config = function()
            require("aerial").setup()
        end,
    })

    -- for bracket colorizing
    use 'luochen1990/rainbow'

    -- to have a minimap on the top right just like vscode to show the code overview in a single view
    -- use 'wfxr/minimap.vim'
    -- use 'wfxr/code-minimap'

    -- to help with the commenting
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- to customize bottom status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- show git changes in the buffer
    use 'lewis6991/gitsigns.nvim'

    -- Rest client like postman
    use 'mistweaverco/kulala.nvim'


    -- Required plugins
    use 'MunifTanjim/nui.nvim'
    use {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
            file_types = { "markdown", "md", "Avante" },
        },
        ft = { "markdown", "md", "Avante" },
    }

    -- Avante Cursor like plugin for vim
    use 'HakonHarnes/img-clip.nvim'
    use 'zbirenbaum/copilot.lua'
    use 'stevearc/dressing.nvim'
    use 'folke/snacks.nvim'
    -- REMEMBER THIS PLUGIN IS DUMB AND THROWS ERROR IN THE FIRST INSTALL TO FIX THAT RUN ":AvanteBuild" TO BUILD THE SOURCE CODE
    -- ALSO YOU HAVE TO AUTHENTICATE COPILOT OR SET THE API KEY
    use {
        'yetone/avante.nvim',
        branch = 'main',
        run = 'make BUILD_FROM_SOURCE=true',
        opts = {
            provider = "copilot",
            providers = {
                copilot = {
                    enabled = true,
                    model = "copilot/claude-sonnet-4",
                    keymaps = {
                        accept = "<C-l>",
                        next = "<C-n>",
                        prev = "<C-p>",
                        dismiss = "<C-e>",
                    },
                },
            }
        },
        config = function()
            require('avante').setup({
                input = {
                    provider = "dressing",
                    provider_opts = {
                        title = "Avante Input",
                    }
                },
                -- Disable the sidebar completely
                behaviour = {
                    auto_suggestions = false,
                    auto_set_highlight_group = true,
                    auto_set_keymaps = true,
                    auto_apply_diff_after_generation = false,
                    support_paste_from_clipboard = false,
                },
                windows = {
                    position = "right", -- or "left"
                    width = 30,
                    sidebar_header = {
                        align = "center",
                        rounded = true,
                    },
                    sidebar = false,
                },
                panel = {
                    enabled = false,
                },
            })
        end
    }

    -- Themes
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "scottmckendry/cyberdream.nvim" }
    use "joshdick/onedark.vim"
    use "sainnhe/everforest"
    use "nordtheme/vim"
    use 'EdenEast/nightfox.nvim'
end)

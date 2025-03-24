local lsp_zero = require('lsp-zero')

lsp_zero.preset("recommended")

require('mason').setup({
    ensure_installed = {
        'alex',
        'autopep8',
        'cpptools',
        'gofumpt',
        'goimports',
        'gotests',
        'cspell',
        'prettier',
        'black',
        'sqlfmt',
    }
})

require('mason-lspconfig').setup({
    ensure_installed = {
        'eslint',
        'rust_analyzer',
        'ts_ls',
        'lua_ls',
        'dockerls',
        'html',
        'cssls',
        'docker_compose_language_service',
        'biome',
        'prismals',
        'jsonls',
        'nginx_language_server',
        'unocss',
        'yamlls',
        'tailwindcss',
        'pyright',
        'gopls',
        'sqls',
        'bashls'
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

function _G.open_definition_in_new_tab()
    local current_file = vim.api.nvim_buf_get_name(0)

    vim.lsp.buf.definition()

    vim.defer_fn(function()
        local new_file = vim.api.nvim_buf_get_name(0)
        vim.api.nvim_command('tabnew')
        vim.api.nvim_command('edit ' .. new_file)
        vim.api.nvim_command('tabprevious')
        vim.api.nvim_command('edit ' .. current_file)
        vim.api.nvim_command('tabnext')
    end, 100)
end

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gdn", '<cmd>lua open_definition_in_new_tab()<CR>', opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vcr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- Use LuaSnip for snippet expansion
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true }) -- Confirm completion with Tab
            else
                fallback()             -- Fallback to default Tab behavior
            end
        end, { 'i', 's' }),
    })
})

require('lspconfig').emmet_ls.setup({
  filetypes = {
    'html', 'css', 'javascriptreact', 'typescriptreact',
    'svelte', 'vue', 'astro', 'php'
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
        -- Add these lines to enable HTML5 template expansion:
        ["output.selfClosingStyle"] = "xhtml", -- or "html"
        ["output.attributeQuotes"] = "double",
      },
    },
    jsx = {
      options = {
        ["output.selfClosingStyle"] = "xhtml",
      },
    },
    -- Enable expansion for "!" (HTML5 boilerplate)
    ["emmet.triggerExpansionOnTab"] = true,
  },
})

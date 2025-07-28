require("oil").setup({
    -- keep the default keymaps, including g. to toggle hidden
    use_default_keymaps = true,

    view_options = {
        -- show dotfiles when opening Oil
        show_hidden = true,

        -- define hidden: anything that starts with a dot, but not "." or ".."
        is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
                and name ~= "."
                and name ~= ".."
        end,

        -- nothing is always hidden
        is_always_hidden = function(name, bufnr)
            return false
        end,
    },
})

local telescope = require("telescope")
local builtin = require('telescope.builtin')
local trouble = require("trouble")
local actions = require("telescope.actions")

require("trouble").setup({
    position = "left", -- Moves the list to the left sidebar
    width = 40,      -- Adjust sidebar width as needed
})

telescope.load_extension("file_browser")

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set("n", "<leader>sf", function()
    builtin.live_grep({
        attach_mappings = function(_, map)
            map("i", "<C-q>", function(prompt_bufnr)
                trouble.open("quickfix")
                actions.send_to_qflist(prompt_bufnr)
            end)
            return true
        end,
    })
end, { desc = "Search and show results in sidebar" })

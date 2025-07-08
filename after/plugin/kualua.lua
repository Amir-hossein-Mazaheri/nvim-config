require('kulala').setup({
    default_view = "body",
    default_env = ".env.dev",
    debug = false,
})

-- Run current request
vim.keymap.set('n', '<leader>rr', '<cmd>lua require("kulala").run()<CR>')

-- Set environment
vim.keymap.set('n', '<leader>re', '<cmd>lua require("kulala").set_selected_env()<CR>')

-- Show stats/info
vim.keymap.set('n', '<leader>rs', '<cmd>lua require("kulala").show_stats()<CR>')

-- Toggle between request and response
vim.keymap.set('n', '<leader>rt', '<cmd>lua require("kulala").toggle_view()<CR>')

-- Copy request as curl command
vim.keymap.set('n', '<leader>rc', '<cmd>lua require("kulala").copy()<CR>')

-- Replay last request
vim.keymap.set('n', '<leader>rl', '<cmd>lua require("kulala").replay()<CR>')

-- Disable minimap when entering dbui or .http files
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
    pattern = { "dbui", "*.http", "http" },
    callback = function()
        -- === Close minimap.vim if running ===
        if vim.fn.exists(":MinimapClose") == 2 then
            vim.cmd("MinimapClose")
        end

        -- === Kill code-minimap external process (if running) ===
        if vim.fn.executable("code-minimap") == 1 then
            vim.fn.jobstart("pkill -f code-minimap", { detach = true })
        end

        -- Prevent auto-restarting on new buffers
        vim.g.minimap_auto_start = 0
        vim.g.minimap_auto_start_win_enter = 0
    end,
})

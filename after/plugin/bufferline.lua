local bufferline = require('bufferline')

bufferline.setup({
    options = {
        hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' }
        },
        separator_style = "slant",
        mode = "tabs",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        style_preset = bufferline.style_preset.italic,
        offsets = {
            {
                filetype = "oil",
                text = "File Explorer",
                text_align = "center",
            },
        },
    },
})

-- Gos to next tab
vim.keymap.set("n", "gt", function()
    vim.cmd("BufferLineCycleNext")
end)

-- Gos to previous tab
vim.keymap.set("n", "gT", function()
    vim.cmd("BufferLineCyclePrev")
end)

-- Create a new tab
vim.keymap.set("n", "<leader>nc", function()
    vim.cmd("tabnew")
end)

-- Close current tab
vim.keymap.set("n", "<leader>nq", function()
    vim.cmd("tabclose")
end)

-- Create vertical split
vim.keymap.set("n", "<leader>nv", function()
    vim.cmd("vsplit")
end)

-- Create horizontal split
vim.keymap.set("n", "<leader>nh", function()
    vim.cmd("hsplit")
end)

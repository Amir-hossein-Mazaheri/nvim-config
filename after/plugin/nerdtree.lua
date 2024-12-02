-- Toggle NerdTree
vim.keymap.set("n", "<leader>n", vim.cmd.NERDTreeToggle)

-- Gos to next tab
vim.keymap.set("n", "<leader>nn", function()
    vim.cmd("tabn")
end)

-- Gos to previous tab
vim.keymap.set("n", "<leader>np", function()
    vim.cmd("tabp")
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

-- Close split
vim.keymap.set("n", "<leader>ns", function()
    vim.cmd("close")
end)

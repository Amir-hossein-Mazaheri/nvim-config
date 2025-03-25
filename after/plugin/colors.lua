function ColorMyTerminal(color)
	color = color or 'onedark'

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- let g:everforest_background = 'hard'

ColorMyTerminal()
-- ColorMyTerminal('everforest')
-- ColorMyTerminal('nightfox')
-- ColorMyTerminal('nord')
-- ColorMyTerminal('catppuccin')
-- ColorMyTerminal('cyberdream')
-- ColorMyTerminal('everforest')

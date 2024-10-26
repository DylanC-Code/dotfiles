-- lua/dylan/catppuccin.lua
local M = {}

M.setup = function()
    require("catppuccin").setup({
        flavour = "frappe", -- Choisis le style de couleur : latte, frappe, macchiato, mocha
	transparent_background = true
    })
    vim.cmd("colorscheme catppuccin")
end

return M

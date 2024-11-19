local function config()
    vim.cmd [[colorscheme tokyonight-storm]]
end

return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = config
    }
}

local function config()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        --                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript", "rust", "asm", "dockerfile", "javascript", "html" },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
    })
end

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = config,
    },
}

local function mason_config()
    require("mason").setup()
end

local function mason_lsp_config()
    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls" },
        handlers = {
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end,
        },
    })
end

return {
    {
        "williamboman/mason.nvim",
        config = mason_config,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = mason_lsp_config,
    },
}

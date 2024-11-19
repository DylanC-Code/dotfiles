-- local function connect_my_lsp()
--     local client = vim.lsp.start_client({
--         name = "my_nasm_lsp_client",
--         cmd = { "/home/dylan/Workspaces/nasm_lsp/target/debug/nasm_lsp" },
--     })
-- 
--     if not client then
--         vim.notify("You didn't start the lsp client correctly!")
--         return
--     end
-- 
--     vim.api.nvim_create_autocmd("FileType", {
--         pattern = "asm",
--         callback = function(args)
--             vim.lsp.buf_attach_client(0, client)
-- 
--  --           vim.lsp.start({
--  --               name = "My ASM LSP",
--  --               cmd = { "/home/dylan/Workspaces/nasm_lsp/target/debug/nasm_lsp" },
--  --               root_dir = vim.fs.root(args.buf, { "main.asm" }),
--  --           })
--         end,
--     })
-- end

local function config()
    -- Reserve a space in the gutter
    -- This will avoid an annoying layout shift in the screen
    vim.opt.signcolumn = "yes"

    -- Add cmp_nvim_lsp capabilities settings to lspconfig
    -- This should be executed before you configure any language server
    local lspconfig_defaults = require("lspconfig").util.default_config
    lspconfig_defaults.capabilities =
        vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

    -- This is where you enable features that only work
    -- if there is a language server active in the file
    vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
            local opts = { buffer = event.buf }

            vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
            vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
            vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
            vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
            vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
            vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
            vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
            vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
            vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
    })

    vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

    vim.diagnostic.config({
        virtual_text = false,
        severity_sort = true,
        float = {
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    })

    --connect_my_lsp()
end

return {
    { "neovim/nvim-lspconfig", config = config },
}

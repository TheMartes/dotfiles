return {
    {
        "neoim/nvim-lspconfig",
        dependencies = {
            'saghen/blink.cmp',
        },

        config = function(_, opts)
            local lspconfig = require('lspconfig')
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    require('lsp.handlers').setup(client, bufnr)
                end,
            })

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.astro.setup({
                capabilities = capabilities,
            })
            lspconfig.intelephense.setup({
                capabilities = capabilities,
            })
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            -- Keymaps
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}


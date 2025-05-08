return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'saghen/blink.cmp',
        },

        config = function(_, opts)
            local lspconfig = require('lspconfig')
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            lspconfig.lua_ls.setup({
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
                settings = {
                    gopls = {
                        gofumpt = true,
                    }
                }
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            lspconfig.ols.setup({
                capabilities = capabilities,
            })

            lspconfig.emmet_ls.setup({
                capabilities = capabilities,
            })

            local vue_typescript_plugin_path = vim.fn.stdpath('data')
              .. '/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin'

            lspconfig.ts_ls.setup {
                init_options = {
                  plugins = {
                    {
                      name = '@vue/typescript-plugin',
                      location = vue_typescript_plugin_path,
                      languages = { 'vue' },
                    },
                  },
                },
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
                single_file_support = false,
            }

            lspconfig.volar.setup {
                capabilities = capabilities
            }

            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.eslint.setup({
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


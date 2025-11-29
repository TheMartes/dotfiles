return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'saghen/blink.cmp',
        },

        config = function(_, opts)
            local lspconfig = require('lspconfig')
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })

            vim.lsp.config("astro", {
                capabilities = capabilities,
            })
            vim.lsp.config("intelephense", {
                capabilities = capabilities,
            })
            vim.lsp.config("tailwindcss", {
                capabilities = capabilities,
                settings = {
                    gopls = {
                        gofumpt = true,
                    }
                }
            })
            vim.lsp.config("gopls", {
                capabilities = capabilities,
            })

            vim.lsp.config("ols", {
                capabilities = capabilities,
            })

            vim.lsp.config("emmet_ls", {
                capabilities = capabilities,
            })

            local vue_typescript_plugin_path = vim.fn.stdpath('data')
              .. '/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin'

            vim.lsp.config("ts_ls", {
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
            })

            vim.lsp.config("volar", {
                capabilities = capabilities
            })

            vim.lsp.config("html", {
                capabilities = capabilities,
            })
            vim.lsp.config("cssls", {
                capabilities = capabilities,
            })
            vim.lsp.config("eslint", {
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


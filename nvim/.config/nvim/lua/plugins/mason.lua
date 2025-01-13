return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "bash_ls",
                    "astro",
                    "clangd",
                    "tailwindcss",
                    "cssls",
                    "docker_compose_language_service",
                    "dockerls",
                    "emmet_ls",
                    "gopls",
                    "htmx",
                    "html",
                    "denols",
                    "eslint",
                    "jsonls",
                    "markdown_oxide",
                    "intelephense",
                    "sqls",
                    "svelte",
                    "terraformls",
                    "zls",
                    "yamlls",
                    "vuels",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.ts_ls.setup({})
            lspconfig.bash_ls.setup({})
            lspconfig.astro.setup({})
            lspconfig.clangd.setup({})
            lspconfig.tailwindcss.setup({})
            lspconfig.cssls.setup({})
            lspconfig.docker_compose_language_service.setup({})
            lspconfig.dockerls.setup({})
            lspconfig.emmet_ls.setup({})
            lspconfig.gopls.setup({})
            lspconfig.htmx.setup({})
            lspconfig.html.setup({})
            lspconfig.denols.setup({})
            lspconfig.eslint.setup({})
            lspconfig.jsonls.setup({})
            lspconfig.markdown_oxide.setup({})
            lspconfig.intelephense.setup({})
            lspconfig.sqls.setup({})
            lspconfig.svelte.setup({})
            lspconfig.terraformls.setup({})
            lspconfig.zls.setup({})
            lspconfig.yamlls.setup({})
            lspconfig.vuels.setup({})

            -- Keymaps
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}

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
}

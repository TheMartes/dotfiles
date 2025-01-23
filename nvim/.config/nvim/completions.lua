return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    version = '*',

    ---@module 'blink.cmp'
    opts = {
        keymap = { preset = 'super-tab' },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'normal'
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
    },
    opts_extend = { "sources.default" },
    signature = {
        enabled = true,
        auto_open = true,
    },
}

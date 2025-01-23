return {
    {
      'saghen/blink.cmp',
      dependencies = 'rafamadriz/friendly-snippets',

      version = '*',

      opts = {
        keymap = { preset = 'super-tab' },

        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = 'normal'
        },

        signature = {
          enabled = true
        },
      },
    },
}
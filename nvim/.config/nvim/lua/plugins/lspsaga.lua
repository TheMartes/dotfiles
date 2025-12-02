return {
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({
                lightbulb = {
                    enable = false,
                },
                symbol_in_winbar = {
                    enable = false,
                }
            })
            local opts = { noremap = true, silent = true }

            vim.keymap.set('n', '<F2>', '<Cmd>Lspsaga rename<CR>', opts)
            vim.keymap.set('n', '<F1>', '<Cmd>Lspsaga peek_definition<CR>', opts)
        end,
    },
}

return {
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({
                lightbulb = {
                    enable = false,
                },
            })
            local opts = { noremap = true, silent = true }

            vim.keymap.set('n', '<F2>', '<Cmd>Lspsaga rename<CR>', opts)
        end,
    },
}

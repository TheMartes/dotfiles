return {
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({})
            local opts = { noremap = true, silent = true }

            vim.keymap.set('n', '<F2>', '<Cmd>Lspsaga rename<CR>', opts)
        end,
    },
}

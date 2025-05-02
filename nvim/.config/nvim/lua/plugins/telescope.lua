return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        "smartpde/telescope-recent-files",
        dependencies = { "nvim-telescope/telescope.nvim" }
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup {
              pickers = {
                find_files = {
                  follow = true,
                },
              },
              extensions = {
                ["ui-select"] = {
                  require("telescope.themes").get_dropdown {}
                },
                ["recent_files"] = {
                  only_cwd = true,
                }
              }
            }
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("aerial")
            require('telescope').load_extension('recent_files')
        end
    }
}

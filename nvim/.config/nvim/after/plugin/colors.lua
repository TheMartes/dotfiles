require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = { "bold" },
        strings = {},
        variables = { "bold"},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
})

function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()

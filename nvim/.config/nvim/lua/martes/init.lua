function CreateNoremapGlobal(type, opts)
	return function(lhs, rhs)
		vim.api.nvim_set_keymap(type, lhs, rhs, opts)
	end
end

function CreateNoremap(type, opts)
	return function(lhs, rhs, bufnr)
        bufnr = bufnr or 0
		vim.api.nvim_buf_set_keymap(bufnr, type, lhs, rhs, opts)
	end
end

NnoremapGlobal = CreateNoremapGlobal("n", { noremap = true })
NnoremapGlobal("<leader>nc", "<cmd>:lua require(\"tree-navigation.telescope\").navigate_to(require(\"tree-navigation\").get_class_nodes())<CR>");

Nnoremap = CreateNoremap("n", { noremap = true })
Inoremap = CreateNoremap("i", { noremap = true })

require("martes.lsp")

require('numb').setup()
require("tidy").setup()

require("todo-comments").setup()
require('hlargs').setup()

require("project_nvim").setup({
    detection_methods = { ".git", "Makefile", "*.sln", "build/env.sh" }
})
require('telescope').load_extension('projects')
require("telescope").load_extension "file_browser"
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close
          },
        },
        vimgrep_arguments = {
            "--trim",
        },
        file_ignore_patterns = {
        }
    },
    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
        }
    }
})

require('go').setup({
    -- notify: use nvim-notify
    notify = false,
    -- auto commands
    auto_format = true,
    auto_lint = true,
    -- linters: revive, errcheck, staticcheck, golangci-lint
    linter = 'revive',
    -- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
    linter_flags = {},
    -- lint_prompt_style: qf (quickfix), vt (virtual text)
    lint_prompt_style = 'vt',
    -- formatter: goimports, gofmt, gofumpt
    formatter = 'goimports',
    -- maintain cursor position after formatting loaded buffer
    maintain_cursor_pos = true,
    -- test flags: -count=1 will disable cache
    test_flags = {'-v'},
    test_timeout = '30s',
    test_env = {},
    -- show test result with popup window
    test_popup = true,
    test_popup_auto_leave = false,
    test_popup_width = 80,
    test_popup_height = 10,
    -- test open
    test_open_cmd = 'edit',
    -- struct tags
    tags_name = 'json',
    tags_options = {'json=omitempty'},
    tags_transform = 'camelcase',
    tags_flags = {'-skip-unexported'},
    -- quick type
    quick_type_flags = {'--just-types'},
})

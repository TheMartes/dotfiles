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
require("nvim-gps").setup()

require("todo-comments").setup()
require('hlargs').setup()

require("project_nvim").setup({
    detection_methods = { ".git", "Makefile", "*.sln", "build/env.sh" }
})
require('telescope').load_extension('projects')
require("telescope").load_extension "file_browser"

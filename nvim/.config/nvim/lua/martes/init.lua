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

require('vgit').setup()
require('numb').setup()
require("tidy").setup()
require('lualine').setup()
require("nvim-gps").setup()
require("nnn").setup({
	picker = {
		cmd = "tmux new-session nnn -Pp",
		style = { border = "rounded" },
		session = "shared",
	},
	replace_netrw = "picker",
})

-- Configure Status line to provide breacrumbs
local gps = require("nvim-gps")

require("lualine").setup({
	sections = {
			lualine_c = {
				{ gps.get_location, cond = gps.is_available },
			}
	}
})


require("project_nvim").setup({
    detection_methods = { ".git", "Makefile", "*.sln", "build/env.sh" }
})
require('telescope').load_extension('projects')

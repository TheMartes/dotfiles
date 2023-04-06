local lsp = require('lsp-zero')
local diagnosticls = require("diagnosticls-configs")
local lspconfig = require("lspconfig")
lsp.preset('recommended')

vim.cmd("doautocmd BufNewFile,BufRead *.php setfiletype php")

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
require("mason").setup({
    PATH = "prepend", -- "skip" seems to cause the spawning error
})

local function on_attach(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	if client.name == "eslint" then
		vim.cmd.LspStop('eslint')
		return
	end

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "<leader>gu", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>qq", vim.lsp.buf.code_action, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

lspconfig.intelephense.setup({
    settings = {
        intelephense = {
            environment = {
                includePaths = { "**/vendor/**" }
            },
            files = {
                exclude = {
                      "**/.git/**",
                      "**/.svn/**",
                      "**/.hg/**",
                      "**/CVS/**",
                      "**/.DS_Store/**",
                      "**/node_modules/**",
                      "**/bower_components/**",
                      "**/vendor/**/{Test,test,Tests,tests}/**/*Test.php"
                }
            }
        }
    }
})

local default_config = {
	on_attach = on_attach,
	capabilities = capabilities,
}

lsp.ensure_installed({
    'cssls',
	'tsserver',
    'dockerls',
    'bashls',
    'html',
	'eslint',
	'lua_ls',
	'gopls',
	'intelephense',
    'yamlls',
    'jsonls',
})

lspconfig.bashls.setup(default_config)
lspconfig.cssls.setup(default_config)
lspconfig.dockerls.setup(default_config)
lspconfig.eslint.setup(default_config)
lspconfig.intelephense.setup(default_config)
lspconfig.html.setup(default_config)
lspconfig.jsonls.setup(default_config)
lspconfig.yamlls.setup(default_config)
lspconfig.gopls.setup(default_config)
lspconfig.lua_ls.setup(default_config)

-- Typescript/JavaScript
local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
})

-- Lua
local lua_rtp = vim.split(package.path, ";")
table.insert(lua_rtp, "lua/?.lua")
table.insert(lua_rtp, "lua/?/init.lua")

lspconfig.lua_ls.setup(vim.tbl_extend("force", default_config, {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = lua_rtp,
			},
			diagnostics = { globals = { "vim" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
}))


diagnosticls.init({
	on_attach = function(_, bufnr)
		register_fmt_keymap("diagnosticls", bufnr)
		register_fmt_autosave("diagnosticls", bufnr)
	end,
})

local web_configs = {
	linter = require("diagnosticls-configs.linters.eslint_d"),
	formatter = require("diagnosticls-configs.formatters.prettier"),
}

diagnosticls.setup({
	javascript = web_configs,
	javascriptreact = web_configs,
	typescript = web_configs,
	typescriptreact = web_configs,
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

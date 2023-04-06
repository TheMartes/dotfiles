-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Themes & Appearance
  use { "catppuccin/nvim", as = "catppuccin" }
  use ('nvim-lualine/lualine.nvim')
  use ('nvim-tree/nvim-web-devicons')
  use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = function()
          require('lspsaga').setup({
              border_style = "rounded",
          })
      end,
  })

  -- LSP
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('fpob/nette.vim')

  use ('rcarriga/nvim-notify') -- for gopls notify on autoformat
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
    }
    use({
        'phpactor/phpactor',
        branch = 'master',
        ft = 'php',
        run = 'composer install --no-dev -o',
    })

  -- Language Specific
  use ('crispgm/nvim-go')

  -- Tools Specific
  use ('gpanders/editorconfig.nvim')
  use {
      'lewis6991/gitsigns.nvim',
      config = function()
          require('gitsigns').setup {
              signs = {
                  add          = { text = '│' },
                  change       = { text = '│' },
                  delete       = { text = '_' },
                  topdelete    = { text = '‾' },
                  changedelete = { text = '~' },
                  untracked    = { text = '┆' },
              },
              current_line_blame = true,
              current_line_blame_opts = {
                  virt_text = true,
                  virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                  delay = 1,
                  ignore_whitespace = false,
              },
          }
      end
  }

  -- Debugers & Diagnostics
  use {
      'creativenull/diagnosticls-configs-nvim',
      tag = 'v0.1.8', -- `tag` is optional
      requires = 'neovim/nvim-lspconfig',
  }

  -- Quality of Life
  use 'm4xshen/autoclose.nvim'
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

end)

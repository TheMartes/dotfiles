require("config/lazy")
--- disable for now, I'm not feeling the vibes
--- require("config/lualine")

-- Keybindings
vim.g.mapleader = ' '

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>sp', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>ht', builtin.help_tags, { desc = 'Telescope help tags' })

-- to show code outline
vim.keymap.set("n", "<leader>pt", "<cmd>Telescope aerial<CR>")

-- Telescope file browser
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>")

-- Recent files
vim.api.nvim_set_keymap("n", "<leader>pr",
    [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
    { noremap = true, silent = true })

-- Recent projects
vim.keymap.set('n', '<leader>pp', "<cmd>NeovimProjectDiscover<CR>", { desc = 'Recent projects' })

-- Explore (netrw)
vim.keymap.set('n', '<leader>pv', '<cmd>Explore<CR>', { desc = "Netrw:)" })

-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- Vim Config
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.g.loaded_matchparen = true

-- Shared Clipboard
-- needs to have wl-clipboard (wl-copy, wl-paste) on wayland, otherwise use xclip

vim.opt.clipboard:prepend { "unnamedplus" }

-- Detect platform and configure clipboard provider
local is_macos = vim.fn.has("macunix") == 1
local is_wayland = os.getenv("WAYLAND_DISPLAY") ~= nil

if is_wayland and not is_macos then
  vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
      ["+"] = "wl-copy --foreground --type text/plain",
      ["*"] = "wl-copy --foreground --type text/plain",
    },
    paste = {
      ["+"] = "wl-paste --no-newline",
      ["*"] = "wl-paste --no-newline",
    },
    cache_enabled = true,
  }
elseif is_macos then
  vim.g.clipboard = {
    name = "pbcopy",
    copy = {
      ["+"] = "pbcopy",
      ["*"] = "pbcopy",
    },
    paste = {
      ["+"] = "pbpaste",
      ["*"] = "pbpaste",
    },
    cache_enabled = true,
  }
end


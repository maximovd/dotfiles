local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt

-- Translate
g.translate_source = 'ru'
g.translate_target = 'en'

-- General
opt.colorcolumn = '120'             -- Разделитель на 120 символов
opt.cursorline = true               -- Подсветка строки с курсором
opt.spelllang= { 'en_us', 'ru' }    -- Словари рус eng
opt.number = true                   -- Включаем нумерацию строк
opt.so=999                          -- Курсор всегда в центре экрана
opt.undofile = true                 -- Возможность отката назад
opt.splitright = true               -- vertical split вправо
opt.splitbelow = true               -- horizontal split вниз

-- Color Scheme
opt.termguicolors = true      --  24-bit RGB colors
cmd'colorscheme onedark'

-- Tabs and spaces
cmd([[
filetype indent plugin on
syntax enable
]])

opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]] -- don't autocomment new lines

-- Navigation
require("nvim-tree").setup({
  auto_reload_on_write = true,  
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    timeout = 400,
  },
})

-- LSP
require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
vim.o.completeopt = 'menuone,noselect'
-- luasnip setup
local luasnip = require 'luasnip'
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer', opts = {
            get_bufnrs = function()
                return vim.api.nvim_list_bufs()
            end
        },
    },
},
}

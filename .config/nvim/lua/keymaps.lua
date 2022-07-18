local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- System buffer shift + Y
map('v', 'S-Y', '"*y', {})

-- F1 .. F12 keymaps

-- <F6> files tree.
map('n', '<F6>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)

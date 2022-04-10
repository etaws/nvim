-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 本地变量
local map = vim.api.nvim_set_keymap

local opt = {
    noremap = true,
    silent = true
}

local pluginKeys = {}

-- nvimTree
map('n', '<C-b>', ':NvimTreeFindFileToggle<CR>', opt)

return pluginKeys

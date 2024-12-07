require('settings')

local load_plugins = true

if load_plugins then
    vim.cmd [[packadd packer.nvim]]
    require('keymaps')
    require('theme')
    require('plugins')
end

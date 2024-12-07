vim.cmd [[packadd packer.nvim]]
vim.g.mapleader = ' '

require('settings')
require('keymaps')
require('theme')
require('plugins')
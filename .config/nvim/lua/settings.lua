-- Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Appearence
vim.cmd('syntax on')
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.cursorline = true

-- Usability
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 10
vim.opt.undofile = true
vim.opt.laststatus = 2
vim.opt.mouse = 'a'
vim.opt.undofile = true

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Misc
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
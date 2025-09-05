-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.errorbells = false
opt.encoding = 'utf-8'
opt.swapfile = false
-- opt.hlsearch = false
opt.backup = false
opt.scrolloff = 10
opt.cmdheight = 0 -- Experimental feature
opt.laststatus = 3
opt.foldmethod = 'marker'
opt.colorcolumn = '120'
opt.conceallevel = 0 -- Shows text normally, specially for .json files ("") and .md lang
opt.shiftwidth = 2
opt.tabstop = 2

-- Filenames -> More info on :h statusline
-- vim.cmd([[set winbar=%=%r%m%w\ %#OwnWinBar#\ %L\ lines\ in:\ %f]])
-- ------
-- UPDATE DEC 2023: I am using 'b0o/incline.nvim' instead of vim.cmd and winbar set
-- plugin to get winbar status for file names and file descriptios.
-- See /lua/plugins/ui for more info
-- ------

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.g.lazyvim_prettier_needs_config = false

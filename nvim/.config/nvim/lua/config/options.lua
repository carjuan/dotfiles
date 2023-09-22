-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.tabstop = 4 -- Number of spaces tabs count for
opt.shiftwidth = 4 -- Size of indent
opt.softtabstop = 4
opt.errorbells = false
opt.encoding = "utf-8"
opt.swapfile = false
opt.hlsearch = false
opt.backup = false
opt.scrolloff = 10
opt.cmdheight = 0 -- Experimental feature
opt.laststatus = 3
opt.foldmethod = "marker"
opt.colorcolumn = "90"
opt.conceallevel = 0 -- Shows text normally, specially for .json files ("") and .md lang

-- More info on :h statusline
vim.cmd([[set winbar=%=%r%m%w\ %#OwnWinBar#\ %L\ lines\ in:\ %f]])

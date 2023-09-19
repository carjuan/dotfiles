-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local setkey = vim.keymap.set

setkey("i", "jj", "<Esc>")

-- I like j gj to move visually and not by blocks (when lines wrapped)
setkey("n", "j", "gj")

-- I like k gk to move visually and not by blocks (when lines wrapped)
setkey("n", "k", "gk")

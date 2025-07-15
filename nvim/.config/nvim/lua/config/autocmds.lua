-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local diagnostics = require('config.diagnostics')
local constants = require('config.constants')

local create_autocmd = vim.api.nvim_create_autocmd

---@see helptag lsp-events
create_autocmd('LspAttach', {
    callback = function(event)
        local diagnostic_context = {
            event = event,
            servers = constants.diagnostics.servers,
            get_client = vim.lsp.get_client_by_id,
            lsp_handlers = vim.lsp.handlers,
        }

        diagnostics.disable(diagnostic_context)
    end,
})

local util = require('config.util')

local M = {}

--NOTE:
-- Do not raise an error. Pretty print user notification
-- vim.api.nvim_echo({
--     { 'Failed to call check table\n', 'ErrorMsg' },
--     { vim.trim(out or ''), 'WarningMsg' },
--     { '\nPress any key to exit...', 'MoreMsg' },
-- }, true, {})

---Disables diagnostics entirely by overriding vim.lsp.handlers table.
---Method 'textDocument/publish_diagnostics' is a `server-client` lsp-notification method.
---@param context DiagnosticContext
---@see help lsp-handler
function M.disable(context)
    -- FIX: I should disable diagnostics related to source code that has a linter already setup see :h lsp-events

    local event = context.event
    local get_client = context.get_client
    local servers = context.servers
    local lsp_handlers = context.lsp_handlers

    local client_id = event.data.client_id
    local client = assert(get_client(client_id))

    for server in pairs(servers) do
        if client.name == server then
            local diagnostic_codes = servers[server].codes
            -- get original definition of handler publishDiagnostics capability
            local publish_diagnostics_handler = lsp_handlers['textDocument/publishDiagnostics']

            -- overide original handler
            lsp_handlers['textDocument/publishDiagnostics'] = function(err, result, ctx)
                local filtered_diagnostics = vim.tbl_filter(function(diagnostic)
                    if diagnostic.code then
                        return not util.is_in_t(diagnostic_codes, diagnostic.code)
                    end
                    return true
                end, result.diagnostics)

                result.diagnostics = filtered_diagnostics

                local ret = publish_diagnostics_handler(err, result, ctx)

                return ret
            end
        end
    end
end

---Hide from UI. You can still get diagnostics by calling vim.diagnostic.get()
---@param event vim.api.create_autocmd.callback.args|vim.api.keyset.create_autocmd.callback_args
---@param get_client fun(client_id: integer): vim.lsp.Client|nil # Function to get an LSP client by id
---@see help vim.diagnostic
function M.hide(event, get_client)
    local client_id = event.data.client_id
    local client = assert(get_client(client_id))

    if client.name == 'vtsls' then
        local bufnr = vim.api.nvim_get_current_buf()
        local client_namespace_id = vim.lsp.diagnostic.get_namespace(client_id)
        vim.diagnostic.enable(false, {
            ns_id = client_namespace_id,
            bufnr = bufnr,
        })
    end
end

return M

---@class DiagnosticCodeInfo
---@field desc string

---@class ServerConfig
---@field codes table<number, DiagnosticCodeInfo>

---@class DiagnosticContext
---@field event vim.api.create_autocmd.callback.args|vim.api.keyset.create_autocmd.callback_args
---@field servers table <string, ServerConfig>
---@field get_client fun(client_id: integer): vim.lsp.Client|nil # Function to get an LSP client by id
---@field lsp_handlers table<string, fun(err?: lsp.ResponseError, result: any, context: lsp.HandlerContext, config?: table): unknown

local M = {}

---@param t table
---@param value number (string | number | integer)
---@return boolean
function M.is_in_t(t, value)
    local ok, out = pcall(vim.tbl_isempty, t)

    if not ok then
        error('Failed to parse table: ' .. type(t) .. '\n' .. out)
    end

    if not value then
        error('Value to look up must be (string | number | integer), but got: ' .. type(value))
    end

    local is_table_empty = out
    local is_in_table = false

    if not is_table_empty then
        if t[value] then
            is_in_table = true
        end
    end
    return is_in_table
end

return M

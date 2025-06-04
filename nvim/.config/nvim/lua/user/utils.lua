local M = {}

function M.insp(table)
  local inspect = vim.inspect
  print(inspect(table))
end

return M

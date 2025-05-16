local create_command = vim.api.nvim_create_user_command
local opt = vim.opt

opt.shiftwidth = 4

create_command('R', function()
  vim.cmd('write')
  vim.cmd('!node %')
end, {})

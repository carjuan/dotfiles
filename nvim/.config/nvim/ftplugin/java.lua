local create_command = vim.api.nvim_create_user_command

create_command('R', function()
  vim.cmd('write')
  vim.cmd('!java %')
end, {})

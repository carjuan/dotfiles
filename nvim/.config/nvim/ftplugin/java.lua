local create_command = vim.api.nvim_create_user_command

vim.o.shiftwidth = 4

create_command('R', function()
  vim.cmd('write')
  vim.cmd('!java %')
end, {})

create_command('C', function()
  vim.cmd('write')
  vim.cmd('!javac %')
end, {})

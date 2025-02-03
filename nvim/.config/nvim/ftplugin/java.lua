local create_command = vim.api.nvim_create_user_command

vim.o.shiftwidth = 8
vim.o.tabstop = 8

create_command('R', function()
  vim.cmd('write')
  vim.cmd('!java %')
end, {})

create_command('C', function()
  vim.cmd('write')
  vim.cmd('!javac %')
end, {})

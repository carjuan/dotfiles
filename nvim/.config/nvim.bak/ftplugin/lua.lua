local create_command = vim.api.nvim_create_user_command

create_command('Run', function()
	vim.cmd('write')
	vim.cmd('source %')
end, {})

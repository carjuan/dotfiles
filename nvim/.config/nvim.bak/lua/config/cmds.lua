vim.api.nvim_create_user_command('Redir', function(ctx)
  local lines = vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
  vim.cmd('new')
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.opt_local.modified = false
end, { nargs = '+', complete = 'command' })

-- See `:h create_user_command` and `:h command-attributes`
-- for command options/attributes
--
-- NOTE: alternative would be `lua =<expression>` to breauty print and inspect
vim.api.nvim_create_user_command('P', function(...)
	local args = {...}
	for _, arg in ipairs(args) do
		print(vim.inspect(arg))
	end
	-- print(vim.inspect(ctx))
	--return vim.inspect(ctx)
end, {nargs = 1})

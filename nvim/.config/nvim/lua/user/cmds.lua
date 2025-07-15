local utils = require('user.utils')

-- Default commands
local split_cmd = function(cmd)
    local result = {}
    local delimiter = ' '
    for match in (cmd .. delimiter):gmatch('(.-)' .. delimiter) do
        table.insert(result, match)
    end
    return result
end

-- prevent typo when pressing `wq` or `q`
local list = {
    'cnoreabbrev <expr> W ((getcmdtype() ==# \':\' && getcmdline() ==# \'W\')?(\'w\'):(\'W\'))',
    'cnoreabbrev <expr> Q ((getcmdtype() ==# \':\' && getcmdline() ==# \'Q\')?(\'q\'):(\'Q\'))',
    'cnoreabbrev <expr> WQ ((getcmdtype() ==# \':\' && getcmdline() ==# \'WQ\')?(\'wq\'):(\'WQ\'))',
    'cnoreabbrev <expr> Wq ((getcmdtype() ==# \':\' && getcmdline() ==# \'Wq\')?(\'wq\'):(\'Wq\'))',
}

for _, v in ipairs(list) do
    vim.cmd(v)
end

-- TODO: Change the function signature to Lua style guide -- follow lazynvim function signature
-- New redir: Gets the output of a command and outputs it in a scratch buffer
-- 1. Get run command and get output -- See API vim.fn.system and vim.fn.systemlist
function Redir(cmd)
    -- TODO: Expand symbols %, ~, etc. in command
    -- ex. node ~ should be node /home/juanse/
    -- ex. node % should be node <current_file>

    -- `%` is used to escape magic characters like '%'
    local tilde_character = '~'

    -- an extra '%' is used to escape magical characters in Lua
    local current_file_character = '%%'
    local command_has_tilde = string.find(cmd, tilde_character)
    local commad_executes_over_curr_file = string.find(cmd, current_file_character)
    local expansion = ''
    if commad_executes_over_curr_file or command_has_tilde then
        local cmd_splitted = split_cmd(cmd)
        local base_cmd = cmd_splitted[1]
        local full_path = ':p'
        local cmd_argument = cmd_splitted[2] .. full_path
        expansion = vim.fn.expand(cmd_argument)
        print(expansion)
    end

    local output = vim.fn.systemlist(expansion)

    -- See :h nvim_create_buf
    local isScratch = true
    local isBufListed = false
    local bufno = vim.api.nvim_create_buf(isBufListed, isScratch)

    vim.api.nvim_buf_set_name(bufno, 'Output Scratch')

    vim.api.nvim_set_option_value('buftype', 'nofile', { buf = bufno })
    vim.api.nvim_set_option_value('bufhidden', 'wipe', { buf = bufno })
    vim.api.nvim_set_option_value('swapfile', false, {
        buf = bufno,
    })

    vim.api.nvim_buf_set_lines(bufno, 0, -1, false, output)

    vim.cmd('vsplit | buffer Output Scratch')
end

-- Registers command Redir
vim.cmd([[command! -nargs=1 -complete=command -bar -range Redir lua Redir(<q-args>, <range>, <line1>, <line2>)]])

-- TODO: Create comman to loop over buffers and print all of them
-- lua buffers = vim.api.nvim_list_bufs() for _, buf in ipairs(buffers) do print(vim.api.nvim_buf_get_name(buf)) end

-- TODO: Create a wrapper for vim.inspect and check lua tables

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
    local args = { ... }
    for _, arg in ipairs(args) do
        print(vim.inspect(arg))
    end
    -- print(vim.inspect(ctx))
    --return vim.inspect(ctx)
end, { nargs = 1 })

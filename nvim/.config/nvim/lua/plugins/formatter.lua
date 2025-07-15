local constants = require('config.constants')

-- source: https://github.com/LazyVim/LazyVim/blob/25abbf546d564dc484cf903804661ba12de45507/lua/lazyvim/plugins/extras/formatting/prettier.lua
return {
    'stevearc/conform.nvim',
    opts = function(_, opts)
        opts.formatters_by_ft = opts.formatters_by_ft or {}
        for _, ft in ipairs(constants.formatter.prettier.disabled) do
            opts.formatters_by_ft[ft] = {}
        end
    end,
}

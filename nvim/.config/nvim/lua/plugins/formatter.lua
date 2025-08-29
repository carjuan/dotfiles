local constants = require('config.constants')

-- source: https://github.com/LazyVim/LazyVim/blob/25abbf546d564dc484cf903804661ba12de45507/lua/lazyvim/plugins/extras/formatting/prettier.lua
return {
    'stevearc/conform.nvim',
    opts = function(_, opts)
        opts.formatters_by_ft = opts.formatters_by_ft or {}
        for _, ft in ipairs(constants.formatter.prettier.disabled) do
            opts.formatters_by_ft[ft] = {}
        end

        -- enable stylelint only for css like files
        for _, ft in ipairs(constants.formatter.stylelint.enabled) do
            opts.formatters_by_ft[ft] = { 'stylelint' }
        end

        -- opts.formatters_by_ft['html'] = { 'stylelint', 'prettierd' }

        -- for any project where a .prettierrc file is not found, use
        -- the following command line options to format when fomatter cmd
        -- 'prettier' is launched
        opts.formatters.prettier = {
            prepend_args = function()
                return {
                    '--prose-wrap',
                    'preserve',
                    '--single-quote',
                    '--no-bracket-spacing',
                    '--tab-width',
                    '2',
                    '--config-precedence',
                    'prefer-file',
                }
            end,
        }
    end,
}

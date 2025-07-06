-- source: https://github.com/LazyVim/LazyVim/blob/25abbf546d564dc484cf903804661ba12de45507/lua/lazyvim/plugins/extras/formatting/prettier.lua
local supported = {
    'css',
    'graphql',
    'handlebars',
    'html',
    'json',
    'jsonc',
    'less',
    'markdown',
    'markdown.mdx',
    'scss',
    'vue',
    'yaml',
}

local disabled = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
}

return {
    'stevearc/conform.nvim',
    opts = function(_, opts)
        opts.formatters_by_ft = opts.formatters_by_ft or {}
        for _, ft in ipairs(disabled) do
            opts.formatters_by_ft[ft] = {}
        end
    end,
}

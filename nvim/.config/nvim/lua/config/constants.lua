local M = {}

M.diagnostics = {
    servers = {
        vtsls = {
            codes = {
                [6133] = {
                    desc = 'declared but its value is never read',
                },
                [2451] = {
                    desc = 'cannot redeclare block scope variable',
                },
                [6196] = {
                    desc = 'declated but its value is never used',
                },
            },
        },
    },
}

M.formatter = {
    prettier = {
        enabled = {
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
        },
        disabled = {
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
        },
    },
    stylelint = {
        enabled = {
            'css',
            'scss',
            'less',
        },
    },
}

return M

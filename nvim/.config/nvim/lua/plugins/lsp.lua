-- Disbales 'no information available lsp message'
-- Adds borders to lsp hover tooltip
local util = require('lspconfig.util')

vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
    config = config
        or {
            border = {
                { '╭', 'Comment' },
                { '─', 'Comment' },
                { '╮', 'Comment' },
                { '│', 'Comment' },
                { '╯', 'Comment' },
                { '─', 'Comment' },
                { '╰', 'Comment' },
                { '│', 'Comment' },
            },
        }
    config.focus_id = ctx.method

    if not (result and result.contents) then
        return
    end

    local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)

    markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)

    if vim.tbl_isempty(markdown_lines) then
        return
    end

    return vim.lsp.util.open_floating_preview(markdown_lines, 'markdown', config)
end

local stylelint_lsp_root_file = {
    '.stylelintrc',
    '.stylelintrc.mjs',
    '.stylelintrc.cjs',
    '.stylelintrc.js',
    '.stylelintrc.json',
    '.stylelintrc.yaml',
    '.stylelintrc.yml',
    'stylelint.config.mjs',
    'stylelint.config.cjs',
    'stylelint.config.js',
}

stylelint_lsp_root_file = util.insert_package_json(stylelint_lsp_root_file, 'stylelint')

return {
    -- Sets up servers
    {
        'neovim/nvim-lspconfig',
        opts = {
            servers = {
                stylelint_lsp = {
                    filetypes = {
                        'astro',
                        'css',
                        'scss',
                        'less',
                    },
                    root_markers = stylelint_lsp_root_file,
                    settings = {
                        autoFixOnSave = true,
                        autoFixOnFormat = true,
                    },
                },
                cssls = {
                    settings = {},
                },
                -- FIX: Only to extend to 'css' files for linting with eslint
                eslint = {
                    filetypes = {
                        'javascript',
                        'javascriptreact',
                        'javascript.jsx',
                        'typescript',
                        'typescriptreact',
                        'typescript.tsx',
                        'vue',
                        'svelte',
                        'css',
                    },
                },
                lua_ls = {
                    settings = {
                        Lua = {
                            hint = {
                                enable = false,
                            },
                        },
                    },
                },
                -- NOTE: Is there a way I can disable the capabilities for this
                -- server on diagnostics
                vtsls = {
                    capabilities = {
                        textDocument = {
                            publishDiagnostics = {},
                        },
                    },
                    settings = {
                        typescript = {
                            inlayHints = {
                                enumMemberValues = { enabled = false },
                                functionLikeReturnTypes = { enabled = false },
                                parameterNames = { enabled = false },
                                parameterTypes = { enabled = false },
                                propertyDeclarationTypes = { enabled = false },
                                variableTypes = { enabled = false },
                            },
                        },
                    },
                },
            },
            -- attaching callbacks on client attachs
            -- setup = {
            --     stylelint_lsp = function(_, opts)
            --         opts.on_attach = function(client, bufnr)
            --             print('attaching boy!!!')
            --         end
            --     end,
            -- },
        },
    },

    -- emmet-language-server + emmet command features
    {
        'olrtg/nvim-emmet',
        config = function()
            vim.keymap.set({ 'n', 'v' }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
        end,
    },

    -- Install lsps and hooks with lsp to ensure servers are installed with the necessary
    -- configuration
    {
        'williamboman/mason.nvim',
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                'luacheck',
                'shellcheck',
                'tailwindcss-language-server',
                'css-lsp',
                'bash-language-server',
                'emmet-language-server',
                'stylua',
                'shfmt',
                'prettierd',
                'stylelint-lsp',
                'stylelint', -- formatter
            })
        end,
    },
}

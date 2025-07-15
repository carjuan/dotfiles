return {
    {
        'NvChad/nvim-colorizer.lua',
        -- opts key is required to call .setup()?
        -- Whiteout opts = {}, plugin won't work.
        opts = {
            filetypes = {
                'css',
                'scss',
            },
            user_default_options = {
                css = true,
                sass = { enable = true, parsers = { 'css' } }, -- Enable sass colors
            },
        },
    },

    {
        'folke/noice.nvim',
        opts = function(_, opts)
            opts.presets.lsp_doc_border = true
        end,
    },

    -- Notifcations timeout
    {
        'rcarriga/nvim-notify',
        opts = {
            timeout = 5000,
        },
    },

    -- Bufferline
    -- Removes every filename at the top
    -- Shows tabpages
    {
        'akinsho/bufferline.nvim',
        event = 'VeryLazy',
        keys = {
            { '<Tab>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next tab' },
            { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Prev tab' },
        },
        opts = {
            options = {
                mode = 'tabs',
                -- separator_style = "slant",
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        },
    },

    -- Winbar Filenames
    {
        'b0o/incline.nvim',
        event = 'BufReadPre',
        priority = 1200,
        config = function()
            require('incline').setup({
                -- highlight = {
                --   groups = {
                --     InclineNormal = { guibg = '#da70ff', guifg = '#ffffff' },
                --     InclineNormalNC = { guifg = '#ffffff', guibg = '#da70ff' },
                --   },
                -- },
                window = { margin = { vertical = 0, horizontal = 1 } },
                hide = {
                    cursorline = true,
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
                    if vim.bo[props.buf].modified then
                        filename = '[+] ' .. filename
                    end

                    local icon, color = require('nvim-web-devicons').get_icon_color(filename)
                    return { { icon, guifg = color }, { ' ' }, { filename } }
                end,
            })
        end,
    },
}

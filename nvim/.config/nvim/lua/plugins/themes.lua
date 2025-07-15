return {
    -- add gruvbox.nvim
    {
        'ellisonleao/gruvbox.nvim',
        opts = { transparent_mode = true },
    },

    -- add kanagawa
    {
        'rebelot/kanagawa.nvim',
        opts = {
            transparent = false,
            theme = 'wave',
            background = {
                dark = 'dragon',
                light = 'lotus',
            },
            overrides = function(colors)
                return {
                    LineNr = { bg = 'none' },
                    SignColumn = { bg = 'none' },
                    GitSignsChange = { bg = 'none' },
                    GitSignsAdd = { bg = 'none' },
                    GitSignsDelete = { bg = 'none' },
                    DiagnosticSignHint = { bg = 'none' },
                }
            end,
        },
    },

    {
        'Mofiqul/adwaita.nvim',
        lazy = false,
        priority = 1000,

        -- configure and set on startup
        config = function()
            vim.g.adwaita_darker = true -- for darker version
            vim.g.adwaita_disable_cursorline = true -- to disable cursorline
            vim.g.adwaita_transparent = true -- makes the background transparent
        end,
    },

    -- add nightfox
    -- setup in 'lazyvim' opts colorscheme options: nightfox || carbonfox || terafox || nordfox
    -- duskfox || dawnfox || day fox
    {
        'EdenEast/nightfox.nvim',
    },

    -- Oxocarbon
    {
        'nyoom-engineering/oxocarbon.nvim',
        -- Add in any other configuration;
        --   event = foo,
        --   config = bar
        --   end,
    },
    {
        'ficcdaf/ashen.nvim',
        lazy = false,
        priority = 1000,
        -- configuration is optional!
        opts = {
            -- your settings here
        },
    },

    -- add catppuccin
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                flavour = 'macchiato', -- latte, frappe, macchiato, mocha
                term_colors = true,
                transparent_background = true,
                no_italic = false,
                no_bold = false,
                styles = {
                    comments = {},
                    conditionals = {},
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                },
                color_overrides = {
                    mocha = {
                        base = '#000000',
                        mantle = '#000000',
                        crust = '#000000',
                    },
                },
                highlight_overrides = {
                    mocha = function(C)
                        return {
                            TabLineSel = { bg = C.pink },
                            CmpBorder = { fg = C.surface2 },
                            Pmenu = { bg = C.none },
                            TelescopeBorder = { link = 'FloatBorder' },
                        }
                    end,
                },
            })
        end,
    },
}

return {
    -- add gruvebox.nvim
    {
        "ellisonleao/gruvbox.nvim",
        opts = { transparent_mode = true },
    },

    -- add kanagawa
    {
        "rebelot/kanagawa.nvim",
        opts = {
            transparent = true,
            theme = "wave",
            background = {
                dark = "dragon",
                light = "lotus",
            },
            overrides = function(colors)
                return {
                    LineNr = { bg = "none" },
                    SignColumn = { bg = "none" },
                    GitSignsChange = { bg = "none" },
                    GitSignsAdd = { bg = "none" },
                    GitSignsDelete = { bg = "none" },
                    DiagnosticSignHint = { bg = "none" },
                }
            end,
        },
    },

    {
        "Mofiqul/adwaita.nvim",
        lazy = false,
        priority = 1000,

        -- configure and set on startup
        config = function()
            vim.g.adwaita_darker = true -- for darker version
            vim.g.adwaita_disable_cursorline = true -- to disable cursorline
            vim.g.adwaita_transparent = true -- makes the background transparent
            vim.cmd("colorscheme adwaita")
        end,
    },

    -- configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "adwaita",
        },
    },
}

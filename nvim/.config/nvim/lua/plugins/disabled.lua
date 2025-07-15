vim.g.snacks_animate = false

return {
    -- disable flash.nvim - <S> search
    { 'folke/flash.nvim', enabled = false },

    -- disables vim.ui plugin for better input
    { 'stevearc/dressing.nvim', enabled = false },

    { 'lukas-reineke/headlines.nvim', enabled = false },

    { 'MeanderingProgrammer/render-markdown.nvim', enabled = false },

    { 'rcarriga/nvim-notify', enabled = false },

    -- disables plugin that completely replaces the UI for messages, cmdline and the popupmenu
    { 'folke/noice.nvim', enabled = false },

    -- disable fancy tablines line
    { 'akinsho/bufferline.nvim', enabled = false },

    { 'folke/snacks.nvim', opts = { dashboard = { enabled = false } } },

    { 'nvim-neo-tree/neo-tree.nvim', enabled = false },

    -- Snacks notifier
    {
        'folke/snacks.nvim',
        opts = {
            notifier = {
                enabled = false,
            },
        },
    },
}

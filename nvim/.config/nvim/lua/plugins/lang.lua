-- Ensures dependencies are installed for the markdown-preview plugin
return {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    config = function()
        vim.fn['mkdp#util#install']()
    end,
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      -- append 'scss' syntax highlighting
      vim.list_extend(opts.ensure_installed, {
        'scss',
      })
    end,
  },
}

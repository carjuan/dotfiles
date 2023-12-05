return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      -- add sass syntax highliting
      vim.list_extend(opts.ensure_installed, {
        'scss',
      })
    end,
  },
}

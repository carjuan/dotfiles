return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      -- append 'scss'
      vim.list_extend(opts.ensure_installed, {
        'astro',
        'cmake',
        'cpp',
        'css',
        'gitignore',
        'graphql',
        'http',
        'scss',
        'sql',
        'svelte',
      })
    end,

    -- the following adds a new extension as a filetype .json
    -- config = function(_, opts)
    --   require('nvim-treesitter.configs').setup(opts)
    --
    --   -- MDX
    --   vim.filetype.add({
    --     extension = {
    --       mdx = 'mdx',
    --     },
    --   })
    --   vim.treesitter.language.register('markdown', 'mdx')
    -- end,
  },
}

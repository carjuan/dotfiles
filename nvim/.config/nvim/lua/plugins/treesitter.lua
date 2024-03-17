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

      -- ISSUE: Treesitter stopped highlighting 'md' files after breaking change
      -- Remove markdown - until current theme 'Carbon' implements new 'treesitter' symbol names
      -- URL: https://github.com/LazyVim/LazyVim/discussions/2536

      -- opts.ensure_installed = vim.tbl_filter(function(i)
      --   return not vim.tbl_contains({ 1 }, 'markdown')
      -- end, opts.ensure_installed)
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

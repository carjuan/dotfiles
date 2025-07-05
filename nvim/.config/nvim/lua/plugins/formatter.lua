local supported = {
  'css',
  'graphql',
  'handlebars',
  'html',
  'json',
  'jsonc',
  'less',
  'markdown',
  'markdown.mdx',
  'scss',
  'vue',
  'yaml',
}

return {
  'stevearc/conform.nvim',
  -- FIX: with the help of lazyvim docs, and modifying formatters_by_ft
  -- I can can have an if/else statment for javascript like files an disable
  -- it for it.
  opts = function(_, opts)
    for _, ft in ipairs(supported) do
      opts.formatters_by_ft = {
        javascript = '',
      }
    end
  end,
}

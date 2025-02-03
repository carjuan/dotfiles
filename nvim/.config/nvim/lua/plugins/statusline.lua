return {
  -- Status line theme
  {
    'nvim-lualine/lualine.nvim',
    -- dependencies = {
    --   'ficcdaf/ashen.nvim',
    -- },
    -- opts = function()
    --   local ashen = require('ashen.plugins.lualine').lualine_opts
    --   ashen.options.component_separators = { '', '' }
    --   ashen.options.section_separators = { '|', '|' }
    --   ashen.extensions = { 'lazy', 'fzf' }
    --   return ashen
    -- end,
    opts = {
      options = {
        section_separators = { '|', '|' },
        component_separators = { '', '' },
      },
      sections = {
        lualine_z = { 'searchcount' },
      },
    },
  },
}

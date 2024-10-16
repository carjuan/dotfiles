return {
  -- Status line theme
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'kanagawa',
        section_separators = { '|', '|' },
        component_separators = { '', '' },
      },
      sections = {
        lualine_z = { 'searchcount' },
      },
    },
  },
}

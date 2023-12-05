return {
  {
    'NvChad/nvim-colorizer.lua',
    -- opts key is required to call .setup()?
    -- Whiteout opts = {}, plugin won't work.
    opts = {
      user_default_options = {
        css = true,
        css_fn = true,
        sass = { enable = true, parsers = { 'css' } }, -- Enable sass colors
      },
    },
  },
}

return {
  'mfussenegger/nvim-lint',
  opts = {
    linters_by_ft = {
      typescript = { 'eslint_d' },
      javascript = { 'eslint_d' },
      bash = {
        cmd = 'shellcheck',
        args = { '-x' }, -- this option sets --external-source=true. Sourcing `./` is fine
      },
      sh = {
        cmd = 'shellcheck',
        args = { '-x' }, -- this option sets --external-source=true. Sourcing `./` is fine
      },
      lua = { 'luacheck' },
    },
  },
}

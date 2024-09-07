return {
  -- Sets up servers
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        cssls = {},
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = false },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
              },
            },
          },
        },
      },
    },
  },

  -- Install lsps and hooks with lsp to ensure servers are installed with the necessary
  -- configuration
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'luacheck',
        'shellcheck',
        'tailwindcss-language-server',
        'css-lsp',
        'bash-language-server',
        'eslint_d',
      })
    end,
  },
}

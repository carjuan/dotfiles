-- Disbales 'no information available lsp message'
-- Adds borders to lsp hover tooltip
vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
  config = config
    or {
      border = {
        { '╭', 'Comment' },
        { '─', 'Comment' },
        { '╮', 'Comment' },
        { '│', 'Comment' },
        { '╯', 'Comment' },
        { '─', 'Comment' },
        { '╰', 'Comment' },
        { '│', 'Comment' },
      },
    }
  config.focus_id = ctx.method

  if not (result and result.contents) then
    return
  end

  local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)

  markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)

  if vim.tbl_isempty(markdown_lines) then
    return
  end

  return vim.lsp.util.open_floating_preview(markdown_lines, 'markdown', config)
end

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

  -- emmet-language-server + emmet command features
  {
    'olrtg/nvim-emmet',
    config = function()
      vim.keymap.set({ 'n', 'v' }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
    end,
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
        'emmet-language-server',
        'stylua',
        'shfmt',
        'prettierd',
      })
    end,
  },
}

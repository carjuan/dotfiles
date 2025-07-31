local fn = vim.fn
local execute = vim.system
local XDG_DATA_PATH = fn.stdpath('data')
local plugin_manager_installation_path = XDG_DATA_PATH .. '/site'
local plug_path = plugin_manager_installation_path .. '/autoload/plug.vim'

local path_exists = function(path)
  local fs = vim.uv.fs_stat
   
  -- Sync check, pass a callback otherwise to make asycn
  -- see `:h vim.uv.fs_stat` 
  return fs(path)
end


if not path_exists(plug_path) then
  local install_cmd = {'curl', '-fLo', plug_path, '--create-dirs', 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'}
  local opts = { text = true }
  local success, err = pcall(execute, install_cmd, opts)
  if not success then
    error('Unble to curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  end
end

vim.api.nvim_create_user_command('PlugI', function()
    vim.cmd('PlugInstall --sync')
    vim.cmd('source  $MYVIMRC')
end, {})

local Plug = vim.fn['plug#']

-- Plugins installation path <$XDG_CONFIG_HOME>/.local/share/nvim/plugged
vim.call('plug#begin')

------ LSP -------
Plug 'williamboman/mason.nvim'
Plug "williamboman/mason-lspconfig.nvim"
Plug 'neovim/nvim-lspconfig'


vim.call('plug#end')

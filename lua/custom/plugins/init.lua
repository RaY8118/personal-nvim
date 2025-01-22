-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- Format on save and linters
local plugins = {
  require 'custom.plugins.comment',
  require 'custom.plugins.tailwind-tools',
  require 'custom.plugins.fugitive',
  require 'custom.plugins.null-ls',
  require 'custom.plugins.typescript-tools',
  require 'custom.plugins.markdown',
  require 'custom.plugins.harpoon',
}

return plugins

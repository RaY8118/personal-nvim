return {
  'mfussenegger/nvim-jdtls',
  ft = { 'java' },
  config = function()
    local jdtls = require 'jdtls'

    -- Detect the project root
    local root_dir = require('jdtls.setup').find_root {
      '.git',
      '.project',
      '.jdtls-root',
      'src',
      'mvnw',
      'gradlew',
    }
    if not root_dir then
      vim.notify('❌ JDTLS: Could not find project root', vim.log.levels.ERROR)
      return
    end

    -- Project name and workspace path
    local project_name = vim.fn.fnamemodify(root_dir, ':t')
    local workspace_dir = vim.fn.stdpath 'cache' .. '/jdtls/workspace/' .. project_name

    print('Root Dir:', root_dir)
    print('Workspace Dir:', workspace_dir)
    print('File:', vim.api.nvim_buf_get_name(0))
    -- Command to start JDTLS
    local config = {
      cmd = {
        vim.fn.expand '~/.local/share/nvim/mason/bin/jdtls',
        '-data',
        workspace_dir,
      },
      root_dir = root_dir,
      settings = {
        java = {
          configuration = {
            -- If you're using plain Java projects with "src" folder
            sourcePaths = { 'src' },
          },
          inlayHints = {
            parameterNames = {
              enabled = 'all', -- Optional but useful
            },
          },
        },
      },
      init_options = {
        bundles = {},
      },
    }

    -- Start or attach to the language server
    jdtls.start_or_attach(config)
  end,
}

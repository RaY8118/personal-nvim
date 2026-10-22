return {
  -- Java LSP: started manually per project (mason's lspconfig jdtls entry is
  -- skipped in lua/kickstart/plugins/lsp-config.lua). Supports projects whose
  -- root is a git repo OR a plain src/ folder.
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
      vim.notify('jdtls: could not find project root', vim.log.levels.ERROR)
      return
    end

    -- One workspace per project so indexes don't clash
    local project_name = vim.fn.fnamemodify(root_dir, ':t')
    local workspace_dir = vim.fn.stdpath 'cache' .. '/jdtls/workspace/' .. project_name

    -- Debugger extensions loaded inside jdtls (both installed via Mason;
    -- without these, jdtls.dap cannot create launch/attach sessions)
    local mason_pkgs = vim.fn.stdpath 'data' .. '/mason/packages'
    local bundles = {}
    for _, pattern in ipairs {
      'java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar',
      'java-test/extension/server/com.microsoft.java.test.plugin-*.jar',
    } do
      vim.list_extend(bundles, vim.split(vim.fn.glob(mason_pkgs .. '/' .. pattern, true), '\n'))
    end

    local config = {
      cmd = {
        vim.fn.stdpath 'data' .. '/mason/bin/jdtls',
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
              enabled = 'all',
            },
          },
        },
      },
      init_options = {
        bundles = bundles,
      },
    }

    -- Register the jdtls-managed nvim-dap java adapter (local launch + remote
    -- attach sessions, both handled by the java-debug bundle) and make main
    -- class configs discoverable via dap.continue. No-op if already set.
    require('jdtls.dap').setup_dap {}

    -- Start or attach to the language server
    jdtls.start_or_attach(config)
  end,
}

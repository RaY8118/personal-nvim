return {
  'mfussenegger/nvim-jdtls',
  config = function()
    local cmd = { vim.fn.expand '~/.local/share/nvim/mason/bin/jdtls' }

    local root_dir = function(fname)
      return vim.fs.dirname(vim.fs.find({ '.git', 'gradlew', 'mvnw', 'src' }, { path = fname, upward = true })[1])
    end

    local project_name = function(root_dir)
      return root_dir and vim.fn.fnamemodify(root_dir, ':t') or 'unknown_project'
    end

    local jdtls_config_dir = function(project_name)
      return vim.fn.stdpath 'cache' .. '/jdtls/' .. project_name .. '/config'
    end

    local jdtls_workspace_dir = function(project_name)
      return vim.fn.stdpath 'cache' .. '/jdtls/' .. project_name .. '/workspace'
    end

    local full_cmd = function(opts)
      local fname = vim.api.nvim_buf_get_name(0)
      local root_dir = opts.root_dir(fname)
      local project_name = opts.project_name(root_dir)
      local cmd = vim.deepcopy(opts.cmd)
      if project_name then
        vim.list_extend(cmd, {
          '-configuration',
          opts.jdtls_config_dir(project_name),
          '-data',
          opts.jdtls_workspace_dir(project_name),
        })
      end
      return cmd
    end

    -- Setup nvim-jdtls
    require('lspconfig').jdtls.setup {
      cmd = cmd,
      root_dir = root_dir,
      project_name = project_name,
      jdtls_config_dir = jdtls_config_dir,
      jdtls_workspace_dir = jdtls_workspace_dir,
      full_cmd = full_cmd,
      dap = { hotcodereplace = 'auto', config_overrides = {} },
      dap_main = {},
      test = true,
      settings = {
        java = {
          inlayHints = {
            parameterNames = {
              enabled = 'all',
            },
          },
        },
      },
    }
  end,
}

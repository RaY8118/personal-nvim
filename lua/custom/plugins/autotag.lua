return {
  'windwp/nvim-ts-autotag',
  config = function()
    require('nvim-ts-autotag').setup {
      opts = {},
      aliases = {
        ['jsx'] = 'html',
      },
    }
  end,
}

return {
  'windwp/nvim-ts-autotag',
  config = function()
    require('nvim-ts-autotag').setup {
      aliases = {
        ['jsx'] = 'html',
      },
    }
  end,
}

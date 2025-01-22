return {
  'navarasu/onedark.nvim',
  opts = { style = 'warmer' },
  config = function(_, opts)
    require('onedark').setup(opts)
    vim.cmd 'colorscheme onedark'
  end,
}

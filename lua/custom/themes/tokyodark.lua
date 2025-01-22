return {
  'tiagovla/tokyodark.nvim',
  opts = { gamma = 0.95 },
  config = function(_, opts)
    require('tokyodark').setup(opts)
    vim.cmd 'colorscheme tokyodark'
  end,
}

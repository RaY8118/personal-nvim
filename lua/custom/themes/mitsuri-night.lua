return {
  dir = vim.fn.stdpath 'config',
  name = 'mitsuri-night',
  lazy = false,
  priority = 1000,

  config = function()
    vim.cmd.colorscheme 'mitsuri-night'
  end,
}

local M = {}

local c = {
  -- Backgrounds
  bg = '#08080D',
  bg_dark = '#050509',
  bg_float = '#0E0E16',
  bg_highlight = '#15151F',
  bg_visual = '#24202C',

  -- Foreground
  fg = '#E8E8F0',
  fg_dim = '#A7A7B5',
  fg_muted = '#686A78',

  -- Mitsuri pink
  pink = '#FF4FA3',
  pink_bright = '#FF78B7',
  pink_soft = '#D94F91',

  -- Mitsuri green
  green = '#7DFF6B',
  green_bright = '#B5FF9A',
  green_soft = '#65D957',

  -- Supporting colors
  purple = '#B78AFF',
  purple_soft = '#8F6CC7',
  cyan = '#72E8FF',
  blue = '#78A9FF',
  yellow = '#FFE66D',
  orange = '#FFAA66',
  red = '#FF5C7A',

  -- UI
  border = '#292936',
  border_active = '#FF4FA3',
  selection = '#302333',
}

function M.setup()
  vim.cmd 'highlight clear'
  vim.o.background = 'dark'
  vim.g.colors_name = 'mitsuri-night'

  local hl = vim.api.nvim_set_hl

  -- =========================================================
  -- Editor
  -- =========================================================

  hl(0, 'Normal', {
    fg = c.fg,
    bg = c.bg,
  })

  hl(0, 'NormalFloat', {
    fg = c.fg,
    bg = c.bg_float,
  })

  hl(0, 'FloatBorder', {
    fg = c.pink,
    bg = c.bg_float,
  })

  hl(0, 'Cursor', {
    fg = c.bg,
    bg = c.pink,
  })

  hl(0, 'CursorLine', {
    bg = c.bg_highlight,
  })

  hl(0, 'CursorLineNr', {
    fg = c.pink,
    bold = true,
  })

  hl(0, 'LineNr', {
    fg = c.fg_muted,
  })

  hl(0, 'SignColumn', {
    fg = c.fg_muted,
    bg = c.bg,
  })

  hl(0, 'Visual', {
    bg = c.selection,
  })

  hl(0, 'Search', {
    fg = c.bg,
    bg = c.green,
    bold = true,
  })

  hl(0, 'IncSearch', {
    fg = c.bg,
    bg = c.pink_bright,
    bold = true,
  })

  hl(0, 'MatchParen', {
    fg = c.pink_bright,
    bg = c.bg_visual,
    bold = true,
  })

  -- =========================================================
  -- Windows / borders
  -- =========================================================

  hl(0, 'WinSeparator', {
    fg = c.border,
  })

  hl(0, 'VertSplit', {
    fg = c.border,
  })

  hl(0, 'StatusLine', {
    fg = c.fg,
    bg = c.bg_dark,
  })

  hl(0, 'StatusLineNC', {
    fg = c.fg_muted,
    bg = c.bg_dark,
  })

  hl(0, 'TabLine', {
    fg = c.fg_muted,
    bg = c.bg_dark,
  })

  hl(0, 'TabLineFill', {
    bg = c.bg_dark,
  })

  hl(0, 'TabLineSel', {
    fg = c.bg,
    bg = c.pink,
    bold = true,
  })

  -- =========================================================
  -- Popup menu
  -- =========================================================

  hl(0, 'Pmenu', {
    fg = c.fg,
    bg = c.bg_float,
  })

  hl(0, 'PmenuSel', {
    fg = c.bg,
    bg = c.pink,
    bold = true,
  })

  hl(0, 'PmenuSbar', {
    bg = c.bg_highlight,
  })

  hl(0, 'PmenuThumb', {
    bg = c.pink,
  })

  -- =========================================================
  -- Syntax
  -- =========================================================

  hl(0, 'Comment', {
    fg = c.fg_muted,
    italic = true,
  })

  hl(0, 'Constant', {
    fg = c.purple,
  })

  hl(0, 'String', {
    fg = c.green_bright,
  })

  hl(0, 'Character', {
    fg = c.green,
  })

  hl(0, 'Number', {
    fg = c.purple,
  })

  hl(0, 'Boolean', {
    fg = c.pink_bright,
    bold = true,
  })

  hl(0, 'Float', {
    fg = c.purple,
  })

  hl(0, 'Identifier', {
    fg = c.fg,
  })

  hl(0, 'Function', {
    fg = c.pink_bright,
    bold = true,
  })

  hl(0, 'Statement', {
    fg = c.pink,
  })

  hl(0, 'Keyword', {
    fg = c.pink,
    bold = true,
  })

  hl(0, 'Operator', {
    fg = c.cyan,
  })

  hl(0, 'PreProc', {
    fg = c.purple,
  })

  hl(0, 'Type', {
    fg = c.green,
    bold = true,
  })

  hl(0, 'Structure', {
    fg = c.green,
  })

  hl(0, 'Special', {
    fg = c.cyan,
  })

  hl(0, 'Delimiter', {
    fg = c.fg_dim,
  })

  hl(0, 'Error', {
    fg = c.red,
    bold = true,
  })

  hl(0, 'Todo', {
    fg = c.bg,
    bg = c.yellow,
    bold = true,
  })

  -- =========================================================
  -- Tree-sitter
  -- =========================================================

  hl(0, '@comment', {
    fg = c.fg_muted,
    italic = true,
  })

  hl(0, '@string', {
    fg = c.green_bright,
  })

  hl(0, '@string.escape', {
    fg = c.green,
  })

  hl(0, '@number', {
    fg = c.purple,
  })

  hl(0, '@boolean', {
    fg = c.pink_bright,
    bold = true,
  })

  hl(0, '@constant', {
    fg = c.purple,
  })

  hl(0, '@constant.builtin', {
    fg = c.purple,
  })

  hl(0, '@variable', {
    fg = c.fg,
  })

  hl(0, '@variable.builtin', {
    fg = c.pink_soft,
  })

  hl(0, '@parameter', {
    fg = c.fg_dim,
  })

  hl(0, '@function', {
    fg = c.pink_bright,
    bold = true,
  })

  hl(0, '@function.call', {
    fg = c.pink_bright,
  })

  hl(0, '@method', {
    fg = c.pink_bright,
  })

  hl(0, '@method.call', {
    fg = c.pink_bright,
  })

  hl(0, '@keyword', {
    fg = c.pink,
    bold = true,
  })

  hl(0, '@keyword.function', {
    fg = c.pink,
    bold = true,
  })

  hl(0, '@type', {
    fg = c.green,
    bold = true,
  })

  hl(0, '@type.builtin', {
    fg = c.green,
  })

  hl(0, '@property', {
    fg = c.cyan,
  })

  hl(0, '@field', {
    fg = c.cyan,
  })

  hl(0, '@operator', {
    fg = c.cyan,
  })

  hl(0, '@punctuation.bracket', {
    fg = c.fg_dim,
  })

  hl(0, '@punctuation.delimiter', {
    fg = c.fg_muted,
  })

  -- =========================================================
  -- Diagnostics
  -- =========================================================

  hl(0, 'DiagnosticError', {
    fg = c.red,
  })

  hl(0, 'DiagnosticWarn', {
    fg = c.yellow,
  })

  hl(0, 'DiagnosticInfo', {
    fg = c.cyan,
  })

  hl(0, 'DiagnosticHint', {
    fg = c.purple,
  })

  hl(0, 'DiagnosticUnderlineError', {
    undercurl = true,
    sp = c.red,
  })

  hl(0, 'DiagnosticUnderlineWarn', {
    undercurl = true,
    sp = c.yellow,
  })

  hl(0, 'DiagnosticUnderlineInfo', {
    undercurl = true,
    sp = c.cyan,
  })

  hl(0, 'DiagnosticUnderlineHint', {
    undercurl = true,
    sp = c.purple,
  })

  -- =========================================================
  -- Git signs
  -- =========================================================

  hl(0, 'GitSignsAdd', {
    fg = c.green,
  })

  hl(0, 'GitSignsChange', {
    fg = c.yellow,
  })

  hl(0, 'GitSignsDelete', {
    fg = c.red,
  })

  -- =========================================================
  -- LSP semantic tokens
  -- =========================================================

  hl(0, '@lsp.type.function', {
    fg = c.pink_bright,
  })

  hl(0, '@lsp.type.method', {
    fg = c.pink_bright,
  })

  hl(0, '@lsp.type.type', {
    fg = c.green,
  })

  hl(0, '@lsp.type.class', {
    fg = c.green,
  })

  hl(0, '@lsp.type.variable', {
    fg = c.fg,
  })

  hl(0, '@lsp.type.parameter', {
    fg = c.fg_dim,
  })

  hl(0, '@lsp.type.property', {
    fg = c.cyan,
  })

  hl(0, '@lsp.type.keyword', {
    fg = c.pink,
  })

  hl(0, '@lsp.type.string', {
    fg = c.green_bright,
  })

  -- =========================================================
  -- Diff
  -- =========================================================

  hl(0, 'DiffAdd', {
    fg = c.green,
    bg = '#102015',
  })

  hl(0, 'DiffChange', {
    fg = c.yellow,
    bg = '#211F12',
  })

  hl(0, 'DiffDelete', {
    fg = c.red,
    bg = '#241218',
  })

  hl(0, 'DiffText', {
    fg = c.pink_bright,
    bg = '#30202B',
  })
end

M.setup()

return M

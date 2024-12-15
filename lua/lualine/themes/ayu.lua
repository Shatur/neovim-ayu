local colors = require('ayu.colors')

local ayu = {
  visual = {
    a = { fg = colors.bg, bg = colors.accent, gui = 'bold' },
    b = { fg = colors.accent, bg = colors.panel_border },
  },
  replace = {
    a = { fg = colors.bg, bg = colors.markup, gui = 'bold' },
    b = { fg = colors.markup, bg = colors.panel_border },
  },
  inactive = {
    a = { fg = colors.fg, bg = colors.panel_border, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.panel_border },
    c = { fg = colors.fg, bg = colors.panel_border },
  },
  normal = {
    a = { fg = colors.bg, bg = colors.entity, gui = 'bold' },
    b = { fg = colors.entity, bg = colors.panel_border },
    c = { fg = colors.fg, bg = colors.panel_border },
  },
  insert = {
    a = { fg = colors.bg, bg = colors.string, gui = 'bold' },
    b = { fg = colors.string, bg = colors.panel_border },
  },
  command = {
    a = { fg = colors.bg, bg = colors.constant, gui = 'bold' },
    b = { fg = colors.constant, bg = colors.panel_border },
  },
  terminal = {
    a = { fg = colors.bg, bg = colors.string, gui = 'bold' },
    b = { fg = colors.string, bg = colors.panel_border },
  },
}

return ayu

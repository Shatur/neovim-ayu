local colors = require('ayu.colors')

local  ayu = {
  visual = {
    a = {fg = colors.bg, bg = colors.accent, gui = 'bold'},
    b = {fg = colors.fg, bg = colors.panel_shadow}
  },
  replace = {
    a = {fg = colors.bg, bg = colors.markup, gui = 'bold'},
    b = {fg = colors.fg, bg = colors.panel_shadow}
  },
  inactive = {
    c = {fg = colors.fg, bg = colors.bg},
    a = {fg = colors.fg, bg = colors.panel_shadow, gui = 'bold'},
    b = {fg = colors.fg, bg = colors.panel_shadow}
  },
  normal = {
    c = {fg = colors.fg_idle, bg = colors.bg},
    a = {fg = colors.bg, bg = colors.entity, gui = 'bold'},
    b = {fg = colors.fg, bg = colors.panel_shadow}
  },
  insert = {
    a = {fg = colors.bg, bg = colors.string, gui = 'bold'},
    b = {fg = colors.fg, bg = colors.panel_shadow}
  }
}

return ayu

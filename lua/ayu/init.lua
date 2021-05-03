local colors = require('ayu.colors')
local utils = require('ayu.utils')
local ayu = {}

function ayu.set_terminal_colors()
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_1 = colors.markup
  vim.g.terminal_color_2 = colors.string
  vim.g.terminal_color_3 = colors.accent
  vim.g.terminal_color_4 = colors.tag
  vim.g.terminal_color_5 = colors.constant
  vim.g.terminal_color_6 = colors.regexp
  vim.g.terminal_color_7 = colors.black
  vim.g.terminal_color_8 = colors.fg_idle
  vim.g.terminal_color_9 = colors.error
  vim.g.terminal_color_10 = colors.string
  vim.g.terminal_color_11 = colors.accent
  vim.g.terminal_color_12 = colors.tag
  vim.g.terminal_color_13 = colors.constant
  vim.g.terminal_color_14 = colors.regexp
  vim.g.terminal_color_15 = colors.comment
  vim.g.terminal_color_background = colors.bg
  vim.g.terminal_color_foreground = colors.fg
end

function ayu.base_groups()
  local groups = {
    Normal = {fg = colors.fg, bg = colors.bg},
    ColorColumn = {bg = colors.line},
    CursorColumn = {bg = colors.line},
    CursorLine = {bg = colors.line},
    CursorLineNr = {fg = colors.accent, bg = colors.line},
    LineNr = {fg = colors.guide_normal},

    Directory = {fg = colors.func},
    ErrorMsg = {fg = colors.fg, bg = colors.error, style = 'standout'},
    VertSplit = {fg = colors.panel_border, bg = colors.bg},
    Folded = {fg = colors.fg_idle, bg = colors.panel_bg},
    FoldColumn = {bg = colors.bg},
    SignColumn = {bg = colors.bg},

    MatchParen = {style = 'underline'},
    ModeMsg = {fg = colors.string},
    MoreMsg = {fg = colors.string},
    NonText = {fg = colors.guide_normal},
    Pmenu = {fg = colors.fg, bg = colors.selection_inactive},
    PmenuSel = {fg = colors.fg, bg = colors.selection_inactive, style = 'reverse'},
    Question = {fg = colors.string},
    Search = {fg = colors.bg, bg = colors.constant},
    IncSearch = {fg = colors.keyword, bg = colors.ui},
    SpecialKey = {fg = colors.selection_inactive},
    SpellCap = {fg = colors.tag, style = 'undercurl'},
    SpellLocal = {fg = colors.keyword, style = 'undercurl'},
    SpellBad = {fg = colors.error, style = 'undercurl'},
    SpellRare = {fg = colors.regexp, style = 'undercurl'},
    StatusLine = {fg = colors.fg, bg = colors.panel_bg},
    StatusLineNC = {fg = colors.fg_idle, bg = colors.panel_bg},
    WildMenu = {fg = colors.fg, bg = colors.markup},
    TabLine = {fg = colors.comment, bg = colors.panel_shadow},
    TabLineFill = {fg = colors.fg, bg = colors.panel_border},
    TabLineSel = {fg = colors.fg, bg = colors.bg},
    Title = {fg = colors.keyword},
    Visual = {bg = colors.selection_inactive},
    WarningMsg = {fg = colors.warning},

    Comment = {fg = colors.comment},
    Constant = {fg = colors.constant},
    String = {fg = colors.string},
    Identifier = {fg = colors.entity},
    Function = {fg = colors.func},
    Statement = {fg = colors.keyword},
    Operator = {fg = colors.operator},
    Exception = {fg = colors.markup},
    PreProc = {fg = colors.accent},
    Type = {fg = colors.entity},
    Structure = {fg = colors.special},
    Special = {fg = colors.accent},
    Delimiter = {fg = colors.special},
    Underlined = {fg = colors.tag, style = 'underline'},
    Ignore = {fg = colors.fg},
    Error = {fg = colors.fg, bg = colors.error},
    Todo = {fg = colors.markup},
    qfLineNr = {fg = colors.keyword},
    Conceal = {fg = colors.comment},
    CursorLineConceal = {fg = colors.guide_normal, bg = colors.line},

    DiffAdd = {bg = colors.vcs_added_bg},
    DiffAdded = {fg = colors.vcs_added},
    DiffChange = {bg = colors.vcs_modified_bg},
    DiffDelete = {bg = colors.vcs_removed_bg},
    DiffRemoved = {fg = colors.vcs_removed},
    DiffText = {bg = colors.vcs_diff_text}
  }

  return groups
end

function ayu.plugin_groups()
  local groups = {
    -- LSP
    LspDiagnosticsSignError = {fg = colors.error},
    LspDiagnosticsSignWarning = {fg = colors.keyword},
    LspDiagnosticsSignInformation = {fg = colors.tag},
    LspDiagnosticsSignHint = {fg = colors.regexp},

    LspDiagnosticsVirtualTextError = {fg = colors.error},
    LspDiagnosticsVirtualTextWarning = {fg = colors.keyword},
    LspDiagnosticsVirtualTextInformation = {fg = colors.tag},
    LspDiagnosticsVirtualTextHint = {fg = colors.regexp},

    LspDiagnosticsUnderlineError = {style = 'undercurl', sp = colors.error},
    LspDiagnosticsUnderlineWarning = {style = 'undercurl', sp = colors.keyword},
    LspDiagnosticsUnderlineInformation = {style = 'undercurl', sp = colors.tag},
    LspDiagnosticsUnderlineHint = {style = 'undercurl', sp = colors.regexp},

    -- TreeSitter
    TSProperty = {fg = colors.special},

    -- Gitsigns
    GitSignsAdd = {fg = colors.vcs_added},
    GitSignsChange = {fg = colors.vcs_modified},
    GitSignsDelete = {fg = colors.vcs_removed},

    -- Telescope
    TelescopePromptBorder = {fg = colors.accent},

    -- Word under cursor
    CursorWord = {bg = colors.selection_inactive},
    CursorWord0 = {bg = colors.selection_inactive},
    CursorWord1 = {bg = colors.selection_inactive},

    -- NvimTree
    NvimTreeGitDirty = {fg = colors.accent},
    NvimTreeGitStaged = {fg = colors.vcs_modified},
    NvimTreeGitMerge = {fg = colors.error},
    NvimTreeGitNew = {fg = colors.vcs_added},
    NvimTreeGitDeleted = {fg = colors.vcs_removed},

    NvimTreeFolderName = {fg = colors.special},
    NvimTreeOpenedFolderName = {fg = colors.special},
    NvimTreeRootFolder = {fg = colors.keyword},
    NvimTreeSpecialFile = {fg = colors.fg},
    NvimTreeExecFile = {},
  }

  return groups
end

function ayu.colorscheme()
  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'ayu'

  colors.generate()
  for group, parameters in pairs(ayu.base_groups()) do
    utils.highlight(group, parameters)
  end

  local async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function()
    ayu.set_terminal_colors()
    for group, parameters in pairs(ayu.plugin_groups()) do
      utils.highlight(group, parameters)
    end
  end))
  async_load_plugin:send()
end

return ayu

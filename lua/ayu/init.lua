local colors = require('ayu.colors')
local config = require('ayu.config')
local ayu = {}

local function set_terminal_colors()
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_1 = colors.markup
  vim.g.terminal_color_2 = colors.string
  vim.g.terminal_color_3 = colors.accent
  vim.g.terminal_color_4 = colors.tag
  vim.g.terminal_color_5 = colors.constant
  vim.g.terminal_color_6 = colors.regexp
  vim.g.terminal_color_7 = colors.fg
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

local function set_groups()
  local groups = {
    -- Base
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { bg = colors.bg },
    FloatBorder = { fg = colors.comment },
    FloatTitle = { fg = colors.fg },
    ColorColumn = { bg = colors.line },
    Cursor = { bg = colors.line },
    CursorColumn = { bg = colors.line },
    CursorLine = { bg = colors.line },
    CursorLineNr = { fg = colors.accent, bg = colors.line },
    LineNr = { fg = colors.guide_normal },

    Directory = { fg = colors.func },
    ErrorMsg = { fg = colors.error },
    VertSplit = { fg = colors.panel_border, bg = colors.bg },
    Folded = { fg = colors.fg_idle, bg = colors.panel_bg },
    FoldColumn = { bg = colors.bg },
    SignColumn = { bg = colors.bg },

    MatchParen = { sp = colors.func, underline = true },
    ModeMsg = { fg = colors.string },
    MoreMsg = { fg = colors.string },
    NonText = { fg = colors.guide_normal },
    Pmenu = { fg = colors.fg, bg = colors.selection_inactive },
    PmenuSel = { fg = colors.fg, bg = colors.selection_inactive, reverse = true },
    Question = { fg = colors.string },
    Search = { fg = colors.bg, bg = colors.constant },
    IncSearch = { fg = colors.keyword, bg = colors.selection_inactive },
    SpecialKey = { fg = colors.selection_inactive },
    SpellCap = { sp = colors.tag, undercurl = true },
    SpellLocal = { sp = colors.keyword, undercurl = true },
    SpellBad = { sp = colors.error, undercurl = true },
    SpellRare = { sp = colors.regexp, undercurl = true },
    StatusLine = { fg = colors.fg, bg = colors.panel_bg },
    StatusLineNC = { fg = colors.fg_idle, bg = colors.panel_bg },
    WildMenu = { fg = colors.fg, bg = colors.markup },
    TabLine = { fg = colors.comment, bg = colors.panel_shadow },
    TabLineFill = { fg = colors.fg, bg = colors.panel_border },
    TabLineSel = { fg = colors.fg, bg = colors.bg },
    Title = { fg = colors.keyword },
    Visual = { bg = colors.selection_inactive },
    WarningMsg = { fg = colors.warning },

    Comment = { fg = colors.comment },
    Constant = { fg = colors.constant },
    String = { fg = colors.string },
    Identifier = { fg = colors.entity },
    Function = { fg = colors.func },
    Statement = { fg = colors.keyword },
    Operator = { fg = colors.operator },
    Exception = { fg = colors.markup },
    PreProc = { fg = colors.accent },
    Type = { fg = colors.entity },
    Structure = { fg = colors.special },
    Special = { fg = colors.accent },
    Delimiter = { fg = colors.special },
    Underlined = { fg = colors.tag, underline = true },
    Ignore = { fg = colors.fg },
    Error = { fg = colors.white, bg = colors.error },
    Todo = { fg = colors.markup },
    qfLineNr = { fg = colors.keyword },
    qfError = { fg = colors.error },
    Conceal = { fg = colors.comment },
    CursorLineConceal = { fg = colors.guide_normal, bg = colors.line },

    DiffAdd = { bg = colors.vcs_added_bg },
    DiffAdded = { fg = colors.vcs_added },
    DiffDelete = { bg = colors.vcs_removed_bg },
    DiffRemoved = { fg = colors.vcs_removed },
    DiffText = { bg = colors.gutter_normal },
    DiffChange = { bg = colors.selection_inactive },

    -- LSP
    DiagnosticError = { fg = colors.error },
    DiagnosticWarn = { fg = colors.keyword },
    DiagnosticInfo = { fg = colors.tag },
    DiagnosticHint = { fg = colors.regexp },

    DiagnosticUnderlineError = { sp = colors.error, undercurl = true },
    DiagnosticUnderlineWarn = { sp = colors.keyword, undercurl = true },
    DiagnosticUnderlineInfo = { sp = colors.tag, undercurl = true },
    DiagnosticUnderlineHint = { sp = colors.regexp, undercurl = true },

    -- Markdown
    markdownCode = { fg = colors.special },

    -- TreeSitter
    TSProperty = { fg = colors.tag },
    TSField = { fg = colors.tag },
    TSParameter = { fg = colors.fg },
    TSUnderline = { sp = colors.tag, underline = true },

    -- Gitsigns
    GitSignsAddLn = { fg = colors.vcs_added },
    GitSignsDeleteLn = { fg = colors.vcs_removed },
    GitSignsChange = { fg = colors.vcs_modified },

    -- Telescope
    TelescopePromptBorder = { fg = colors.accent },

    -- Cmp
    CmpItemAbbrMatch = { fg = colors.keyword },
    CmpItemAbbrMatchFuzzy = { fg = colors.func },
    CmpItemKindText = { fg = colors.string },
    CmpItemKindMethod = { fg = colors.keyword },
    CmpItemKindFunction = { fg = colors.func },
    CmpItemKindConstructor = { fg = colors.keyword },
    CmpItemKindField = { fg = colors.entity },
    CmpItemKindVariable = { fg = colors.tag },
    CmpItemKindClass = { fg = colors.entity },
    CmpItemKindInterface = { fg = colors.entity },
    CmpItemKindModule = { fg = colors.keyword },
    CmpItemKindProperty = { fg = colors.keyword },
    CmpItemKindUnit = { fg = colors.constant },
    CmpItemKindValue = { fg = colors.constant },
    CmpItemKindEnum = { fg = colors.entity },
    CmpItemKindKeyword = { fg = colors.keyword },
    CmpItemKindSnippet = { fg = colors.regexp },
    CmpItemKindColor = { fg = colors.special },
    CmpItemKindFile = { fg = colors.special },
    CmpItemKindReference = { fg = colors.special },
    CmpItemKindFolder = { fg = colors.special },
    CmpItemKindEnumMember = { fg = colors.constant },
    CmpItemKindConstant = { fg = colors.constant },
    CmpItemKindStruct = { fg = colors.entity },
    CmpItemKindEvent = { fg = colors.tag },
    CmpItemKindOperator = { fg = colors.operator },
    CmpItemKindTypeParameter = { fg = colors.tag },
    CmpItemMenu = { fg = colors.comment },

    -- Word under cursor
    CursorWord = { bg = colors.selection_inactive },
    CursorWord0 = { bg = colors.selection_inactive },
    CursorWord1 = { bg = colors.selection_inactive },

    -- NvimTree
    NvimTreeGitDirty = { fg = colors.accent },
    NvimTreeGitStaged = { fg = colors.vcs_modified },
    NvimTreeGitMerge = { fg = colors.error },
    NvimTreeGitNew = { fg = colors.vcs_added },
    NvimTreeGitDeleted = { fg = colors.vcs_removed },

    NvimTreeFolderName = { fg = colors.special },
    NvimTreeFolderIcon = { fg = colors.accent },
    NvimTreeOpenedFolderName = { fg = colors.special },
    NvimTreeRootFolder = { fg = colors.keyword },
    NvimTreeSpecialFile = { fg = colors.fg },
    NvimTreeExecFile = { fg = colors.fg },
    NvimTreeIndentMarker = { fg = colors.guide_normal },

    NvimTreeWindowPicker = { fg = colors.keyword, bg = colors.panel_border, bold = true },

    -- Neo-tree
    NeoTreeRootName = { fg = colors.fg, bold = true },

    -- WhichKey
    WhichKeyFloat = { bg = colors.bg },

    -- Indent blankline
    IndentBlanklineContextChar = { fg = colors.comment },

    -- Neogit
    NeogitDiffContextHighlight = { bg = colors.line },
    NeogitHunkHeader = { fg = colors.tag },
    NeogitHunkHeaderHighlight = { fg = colors.tag, bg = colors.line },
    NeogitDiffAddHighlight = { bg = colors.vcs_added_bg },
    NeogitDiffDeleteHighlight = { bg = colors.vcs_removed_bg },

    -- Hop
    HopNextKey = { fg = colors.keyword, bold = true, underline = true },
    HopNextKey1 = { fg = colors.entity, bold = true, underline = true },
    HopNextKey2 = { fg = colors.tag },
    HopUnmatched = { fg = colors.comment },

    -- LSP Signature
    LspSignatureActiveParameter = { italic = true },

    -- Notify
    NotifyERROR = { fg = colors.vcs_removed },
    NotifyWARN = { fg = colors.func },
    NotifyINFO = { fg = colors.vcs_added },
    NotifyDEBUG = { fg = colors.comment },
    NotifyTRACE = { fg = colors.vcs_modified },
    NotifyERRORTitle = { fg = colors.error },
    NotifyWARNTitle = { fg = colors.warning },
    NotifyINFOTitle = { fg = colors.string },
    NotifyDEBUGTitle = { fg = colors.ui },
    NotifyTRACETitle = { fg = colors.entity },

    -- Dap
    NvimDapVirtualText = { fg = colors.regexp },

    -- DAP UI
    DapUIScope = { fg = colors.func },
    DapUIType = { fg = colors.entity },
    DapUIDecoration = { fg = colors.tag },
    DapUIThread = { fg = colors.string },
    DapUIStoppedThread = { fg = colors.special },
    DapUISource = { fg = colors.regexp },
    DapUILineNumber = { fg = colors.constant },
    DapUIFloatBorder = { fg = colors.panel_border },
    DapUIWatchesEmpty = { fg = colors.warning },
    DapUIWatchesValue = { fg = colors.string },
    DapUIWatchesError = { fg = colors.error },
    DapUIBreakpointsPath = { fg = colors.regexp },
    DapUIBreakpointsInfo = { fg = colors.constant },
    DapUIBreakpointsCurrentLine = { fg = colors.constant, bold = true },

    -- Visual Multi
    VM_Extend = { bg = colors.selection_inactive },
    VM_Cursor = { bg = colors.selection_inactive, sp = colors.fg, underline = true },
    VM_Insert = { sp = colors.fg, underline = true },
    VM_Mono = { fg = colors.bg, bg = colors.comment },
  }

  groups = vim.tbl_extend('force', groups, type(config.overrides) == 'function' and config.overrides() or config.overrides)

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

function ayu.setup(values)
  setmetatable(config, { __index = vim.tbl_extend('force', config.defaults, values) })
end

function ayu.colorscheme()
  if vim.version().minor < 7 then
    vim.notify('Neovim 0.7+ is required for ayu colorscheme', vim.log.levels.ERROR, { title = 'Ayu colorscheme' })
    return
  end

  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end

  vim.g.VM_theme_set_by_colorscheme = true -- Required for Visual Multi
  vim.o.termguicolors = true
  vim.g.colors_name = 'ayu'

  colors.generate(config.mirage)
  set_terminal_colors()
  set_groups()
end

return ayu

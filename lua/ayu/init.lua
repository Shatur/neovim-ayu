local colors = require('ayu.colors')
local config = require('ayu.config')
local ayu = {}

--- Apply terminal highlighting.
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

--- Apply groups highlighting.
local function set_groups()
  local groups = {
    -- Base.
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { bg = colors.bg },
    FloatBorder = { fg = colors.comment },
    FloatTitle = { fg = colors.fg },
    ColorColumn = { bg = colors.line },
    Cursor = { fg = colors.bg, bg = colors.fg },
    CursorColumn = { bg = colors.line },
    CursorLine = { bg = colors.line },
    CursorLineNr = { fg = colors.accent, bg = colors.line },
    LineNr = { fg = colors.guide_normal },

    Directory = { fg = colors.func },
    ErrorMsg = { fg = colors.error },
    WinSeparator = { fg = colors.panel_border, bg = colors.bg },
    VertSplit = { link = 'WinSeparator' },
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
    CurSearch = { fg = colors.bg, bg = colors.special },
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

    Comment = { fg = colors.comment, italic = true },
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
    Underlined = { sp = colors.tag, underline = true },
    Ignore = { fg = colors.fg },
    Error = { fg = colors.white, bg = colors.error },
    Todo = { fg = colors.markup },
    qfLineNr = { fg = colors.keyword },
    qfError = { fg = colors.error },
    Conceal = { fg = colors.comment },
    CursorLineConceal = { fg = colors.guide_normal, bg = colors.line },

    Added = { fg = colors.vcs_added },
    Removed = { fg = colors.vcs_removed },
    Changed = { fg = colors.vcs_modified },
    DiffAdd = { bg = colors.vcs_added_bg },
    DiffAdded = { fg = colors.vcs_added },
    DiffDelete = { bg = colors.vcs_removed_bg },
    DiffRemoved = { fg = colors.vcs_removed },
    DiffText = { bg = colors.gutter_normal },
    DiffChange = { bg = colors.selection_inactive },

    -- LSP.
    DiagnosticError = { fg = colors.error },
    DiagnosticWarn = { fg = colors.keyword },
    DiagnosticInfo = { fg = colors.tag },
    DiagnosticHint = { fg = colors.regexp },

    DiagnosticUnderlineError = { sp = colors.error, undercurl = true },
    DiagnosticUnderlineWarn = { sp = colors.keyword, undercurl = true },
    DiagnosticUnderlineInfo = { sp = colors.tag, undercurl = true },
    DiagnosticUnderlineHint = { sp = colors.regexp, undercurl = true },

    -- Markdown.
    markdownCode = { fg = colors.special },

    -- TreeSitter.
    ['@property'] = { fg = colors.tag },
    ['@tag'] = { fg = colors.keyword },
    ['@tag.attribute'] = { fg = colors.entity },
    ['@tag.delimiter'] = { link = 'Delimiter' },
    ['@type.qualifier'] = { fg = colors.keyword },
    ['@variable'] = { fg = colors.fg },
    ['@variable.builtin'] = { fg = colors.func },
    ['@variable.member'] = { fg = colors.tag },
    ['@variable.parameter'] = { fg = colors.fg },
    ['@module'] = { fg = colors.func },
    ['@markup.heading'] = { fg = colors.keyword },
    ['@keyword.storage'] = { fg = colors.keyword },

    ['@lsp.type.namespace'] = { link = '@module' },
    ['@lsp.type.type'] = { link = '@type' },
    ['@lsp.type.class'] = { link = '@type' },
    ['@lsp.type.enum'] = { link = '@type' },
    ['@lsp.type.interface'] = { link = '@type' },
    ['@lsp.type.struct'] = { link = '@variable.member' },
    ['@lsp.type.parameter'] = { fg = colors.lsp_parameter },
    ['@lsp.type.field'] = { link = '@variable.member' },
    ['@lsp.type.variable'] = { link = '@variable' },
    ['@lsp.type.property'] = { link = '@property' },
    ['@lsp.type.enumMember'] = { link = '@constant' },
    ['@lsp.type.function'] = { link = '@function' },
    ['@lsp.type.method'] = { link = '@function.method' },
    ['@lsp.type.macro'] = { link = '@function.macro' },
    ['@lsp.type.decorator'] = { link = '@function' },
    ['@lsp.mod.constant'] = { link = '@constant' },

    -- TreesitterContext.
    TreesitterContext = { bg = colors.selection_inactive },

    -- Telescope.
    TelescopePromptBorder = { fg = colors.accent },

    -- Cmp.
    CmpGhostText = { fg = colors.comment },
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

    -- Word under cursor.
    CursorWord = { bg = colors.selection_inactive },
    CursorWord0 = { bg = colors.selection_inactive },
    CursorWord1 = { bg = colors.selection_inactive },

    -- Noice
    NoiceLspProgressTitle = { fg = colors.fg },
    NoiceLspProgressClient = { fg = colors.special },

    -- NvimTree.
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

    -- Neo-tree.
    NeoTreeRootName = { fg = colors.fg, bold = true },

    -- WhichKey.
    WhichKeyFloat = { bg = colors.bg },

    -- Indent blankline.
    IndentBlanklineContextChar = { fg = colors.comment },

    -- Neogit.
    NeogitDiffContextHighlight = { bg = colors.line },
    NeogitHunkHeader = { fg = colors.tag },
    NeogitHunkHeaderHighlight = { fg = colors.tag, bg = colors.line },
    NeogitDiffAddHighlight = { bg = colors.vcs_added_bg },
    NeogitDiffDeleteHighlight = { bg = colors.vcs_removed_bg },

    -- Hop.
    HopNextKey = { fg = colors.keyword, bold = true, underline = true },
    HopNextKey1 = { fg = colors.entity, bold = true, underline = true },
    HopNextKey2 = { fg = colors.tag },
    HopUnmatched = { fg = colors.comment },

    -- Leap.
    LeapMatch = { fg = colors.regexp, underline = true },
    LeapLabelPrimary = { fg = colors.bg, bg = colors.regexp },
    LeapLabelSecondary = { fg = colors.bg, bg = colors.entity },
    LeapLabelSelected = { fg = colors.bg, bg = colors.tag },

    -- LSP Inlay Hints.
    LspInlayHint = { fg = colors.lsp_inlay_hint },

    -- LSP Signature.
    LspSignatureActiveParameter = { italic = true },

    -- Notify.
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

    -- Dap.
    NvimDapVirtualText = { fg = colors.regexp },

    -- DAP UI.
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

    -- Visual Multi.
    VM_Extend = { bg = colors.selection_inactive },
    VM_Cursor = { bg = colors.selection_inactive, sp = colors.fg, underline = true },
    VM_Insert = { sp = colors.fg, underline = true },
    VM_Mono = { fg = colors.bg, bg = colors.comment },

    -- Mini.
    MiniFilesTitleFocused = { fg = colors.fg, bold = true },
    MiniHipatternsFixme = { fg = colors.bg, bg = colors.error, bold = true },
    MiniHipatternsHack = { fg = colors.bg, bg = colors.keyword, bold = true },
    MiniHipatternsTodo = { fg = colors.bg, bg = colors.tag, bold = true },
    MiniHipatternsNote = { fg = colors.bg, bg = colors.regexp, bold = true },
    MiniIconsAzure = { fg = colors.tag },
    MiniIconsBlue = { fg = colors.entity },
    MiniIconsCyan = { fg = colors.regexp },
    MiniIconsGreen = { fg = colors.string },
    MiniIconsGrey = { fg = colors.fg },
    MiniIconsOrange = { fg = colors.keyword },
    MiniIconsPurple = { fg = colors.lsp_parameter },
    MiniIconsRed = { fg = colors.error },
    MiniIconsYellow = { fg = colors.special },
    MiniIndentscopeSymbol = { fg = colors.comment },
    MiniIndentscopeSymbolOff = { fg = colors.keyword },
    MiniJump = { sp = colors.keyword, undercurl = true },
    MiniJump2dDim = { fg = colors.comment, nocombine = true },
    MiniJump2dSpot = { fg = colors.keyword, bold = true, underline = true, nocombine = true },
    MiniJump2dSpotAhead = { fg = colors.entity, underline = true, nocombine = true },
    MiniJump2dSpotUnique = { fg = colors.tag, bold = true, underline = true, nocombine = true },
    MiniStarterItemPrefix = { fg = colors.accent },
    MiniStarterFooter = { link = 'Comment' },
    MiniStatuslineDevinfo = { fg = colors.fg, bg = colors.panel_border },
    MiniStatuslineFileinfo = { fg = colors.fg, bg = colors.panel_border },
    MiniStatuslineFilename = { fg = colors.fg_idle, bg = colors.panel_border },
    MiniStatuslineInactive = { fg = colors.fg_idle, bg = colors.panel_border },
    MiniStatuslineModeCommand = { fg = colors.bg, bg = colors.keyword, bold = true },
    MiniStatuslineModeInsert = { fg = colors.bg, bg = colors.string, bold = true },
    MiniStatuslineModeNormal = { fg = colors.bg, bg = colors.entity, bold = true },
    MiniStatuslineModeOther = { fg = colors.bg, bg = colors.regexp, bold = true },
    MiniStatuslineModeReplace = { fg = colors.bg, bg = colors.markup, bold = true },
    MiniStatuslineModeVisual = { fg = colors.bg, bg = colors.accent, bold = true },
    MiniTablineCurrent = { fg = colors.fg, bg = colors.bg, bold = true },
    MiniTablineFill = { fg = colors.fg, bg = colors.panel_border },
    MiniTablineHidden = { fg = colors.comment, bg = colors.panel_shadow },
    MiniTablineModifiedCurrent = { fg = colors.bg, bg = colors.fg, bold = true },
    MiniTablineModifiedHidden = { fg = colors.panel_shadow, bg = colors.comment },
    MiniTablineModifiedVisible = { fg = colors.bg, bg = colors.fg },
    MiniTablineVisible = { fg = colors.fg, bg = colors.bg },
    MiniTestFail = { fg = colors.error, bold = true },
    MiniTestPass = { fg = colors.string, bold = true },
    MiniTrailspace = { bg = colors.vcs_removed },
  }

  groups = vim.tbl_deep_extend('force', groups, type(config.overrides) == 'function' and config.overrides() or config.overrides)

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

--- Apply user settings.
---@param values table
function ayu.setup(values) setmetatable(config, { __index = vim.tbl_extend('force', config.defaults, values) }) end

--- Set the colorscheme.
function ayu.colorscheme()
  if vim.version().minor < 8 then
    vim.notify('Neovim 0.8+ is required for ayu colorscheme', vim.log.levels.ERROR, { title = 'Ayu colorscheme' })
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
  if config.terminal then
    set_terminal_colors()
  end
  set_groups()
end

return ayu

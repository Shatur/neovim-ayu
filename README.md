# Neovim Ayu

A colorscheme for Neovim 0.7+ reimplemented in lua from [ayu-vim](https://github.com/Luxed/ayu-vim).

## Screenshots

![dark](screenshots/dark.png)

![mirage](screenshots/mirage.png)

![light](screenshots/light.png)

## Commands

To apply the colorscheme, you can call `require('ayu').colorscheme()` from lua or use `:colorscheme ayu` command. By default it respect your `background` (see `:h background`) setting to choose between `dark` and `light` variants. But you can use `:colorscheme ayu-<dark,light,mirage>]` commands to apply a variant directly.

## Configuration

To configure the plugin, you can call `require('ayu').setup(values)`, where `values` is a dictionary with the parameters you want to override. Here are the defaults:

```lua
require('ayu').setup({
    mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
    overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
})
```

Alternatively, `overrides` can be a function that returns a dictionary of the same format. You can use the function to override based on a dynamic condition, such as the value of `&background`.

Colorscheme also provides a theme for [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim). You can set in `setup` lualine:

```lua
require('lualine').setup({
  options = {
    theme = 'ayu',
  },
})
```

### `overrides` Examples

1. Replace `IncSearch` group with foreground set to `#FFFFFF`:

```lua
require('ayu').setup({
  overrides = {
    IncSearch = { fg = '#FFFFFF' }
  }
})
```

2. Change the background color of non-active windows to make the active one more obvious, specifying overrides for both light and dark backgrounds:

```lua
require 'ayu'.setup({
  overrides = function()
    return vim.o.background == 'dark' and
          { NormalNC = {bg = '#0f151e', fg = '#808080'} }
          or
          { NormalNC = {bg = '#f0f0f0', fg = '#808080'} }
  end
})

```

**Tip:** You can use `:source $VIMRUNTIME/syntax/hitest.vim` to see all highlighting groups.

To get the colors from the colorscheme you can use `ayu.colors`. Example:

```lua
local colors = require('ayu.colors')
colors.generate() -- Pass `true` to enable mirage

require('ayu').setup({
  overrides = {
    IncSearch = { fg = colors.fg }
  }
})
```

**Tip:** You can use `:lua print(vim.inspect(require('ayu.colors')))` command to check all available colors.

# Neovim Ayu

A theme for Neovim reimplemented in lua from [ayu-vim](https://github.com/Luxed/ayu-vim).

## Screenshots

![dark](screenshots/dark.png)

![mirage](screenshots/mirage.png)

![light](screenshots/light.png)

## Configuration

The theme contains three ayu color options: `light`, `mirage` and `dark`.

It will respect your `background` (see `:h background`) setting to choose between `dark` and `light` variants.

To use `mirage` variant instead of `dark` for dark background you should specify the following anywhere in your configuration:

```lua
vim.g.ayu_mirage = true
```

If you want to change or add some group for highlighting you can use `vim.g.ayu_overrides`. This variable contains a dictionary with a group name which corresponds to a dictionary with parameters (bg, fg, sp and style) and colors in hex. Example:

```lua
vim.g.ayu_overrides = {
  IncSearch = {fg = '#FFFFFF'}
}
```

To get the colors from the theme you can use `ayu.colors`. Example:

```lua
local colors = require('ayu.colors')

vim.g.ayu_overrides = {
  IncSearch = {fg = colors.fg}
}
```

Use `:lua print(vim.inspect(require('ayu.colors')))` command to check all available colors.

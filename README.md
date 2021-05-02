# Neovim Ayu

A theme for Neovim reimplemented in lua from [ayu-vim](https://github.com/Luxed/ayu-vim) (use it for regular Vim).

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

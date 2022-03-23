# miniature.nvim

<div align="center">

  ![GitHub top language](https://img.shields.io/github/languages/top/smb374/miniature.nvim?logo=Lua&style=for-the-badge)
  ![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.6.0+-blueviolet.svg?style=for-the-badge&logo=Neovim)
  
</div>

A neovim config build around [echasnovski/mini.nvim](https://github.com/echasnovski/mini.nvim)

## `mini.nvim` modules used

- `mini.base16`
- `mini.bufremove`
- `mini.comment`
- `mini.cursorword`
- `mini.indentscope`
- `mini.pairs`
- `mini.statusline`
- `mini.surround`
- `mini.tabline`
- `mini.trailspace`

## Configuration
The settings & keymaps are mostly taken from [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch),
with extra plugins and personalized keymaps to suite personal use case.

The configuration structure is pretty simple and easy to modify, however, you'll need to supply your own base16 colorscheme
in `miniature.colorscheme` to correctly set up the color (for `mini.nvim` modules).
For further information on setting the color, read `miniature.colorscheme` and check out [chriskempson/base16](https://github.com/chriskempson/base16).

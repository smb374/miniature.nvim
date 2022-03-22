local present, base16 = pcall(require, "mini.base16")
if not present then
  return
end

local theme_name = vim.g.miniature_color or "default-dark"

local theme_present, theme = pcall(require, string.format("colors.%s", theme_name))
if not theme_present then
  theme = require("colors.default-dark")
end

base16.setup({
  palette = theme
})

-- Italics
vim.cmd [[
  hi Function gui=italic
  hi Keyword  gui=italic
  hi Comment  gui=italic
]]

vim.g.colors_name = "miniature_color"


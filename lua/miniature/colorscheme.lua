local present, base16 = pcall(require, "mini.base16")
if not present then
  return
end

-- You should define your own base16 colorscheme here
-- or load a base16 theme externally.
-- miniature.colorscheme will work as long as the theme
-- has the same format as below.
local theme = {}

theme.base00 = "#2E3440"
theme.base01 = "#3B4252"
theme.base02 = "#434C5E"
theme.base03 = "#4C566A"
theme.base04 = "#D8DEE9"
theme.base05 = "#E5E9F0"
theme.base06 = "#ECEFF4"
theme.base07 = "#8FBCBB"
theme.base08 = "#BF616A"
theme.base09 = "#D08770"
theme.base0A = "#EBCB8B"
theme.base0B = "#A3BE8C"
theme.base0C = "#88C0D0"
theme.base0D = "#81A1C1"
theme.base0E = "#B48EAD"
theme.base0F = "#5E81AC"

base16.setup({
  palette = theme,
})

local highlight = function(group, args)
  local command = string.format(
    [[highlight %s guifg=%s guibg=%s gui=%s guisp=%s]],
    group,
    args.fg or "NONE",
    args.bg or "NONE",
    args.attr or "NONE",
    args.sp or "NONE"
  )
  vim.cmd(command)
end

-- Italics
vim.cmd([[
  hi Function gui=italic
  hi Keyword  gui=italic
  hi Comment  gui=italic
]])

-- nvim-cmp highlights
highlight("CmpDocumentation", { fg = theme.base05, bg = theme.base00 })
highlight("CmpDocumentationBorder", { fg = theme.base0D, bg = theme.base00 })

highlight("CmpItemAbbr", { fg = theme.base05, bg = nil })
highlight("CmpItemAbbrDeprecated", { fg = theme.base03, bg = nil, attr = "strikethrough" })
highlight("CmpItemAbbrMatch", { fg = theme.base0D, bg = nil })
highlight("CmpItemAbbrMatchFuzzy", { fg = theme.base0D, bg = nil })

highlight("CmpItemKindDefault", { fg = theme.base04, bg = nil })
highlight("CmpItemMenu", { fg = theme.base03, bg = nil })

highlight("CmpItemKindKeyword", { fg = theme.base0D, bg = nil })

highlight("CmpItemKindVariable", { fg = theme.base0E, bg = nil })
highlight("CmpItemKindConstant", { fg = theme.base0E, bg = nil })
highlight("CmpItemKindReference", { fg = theme.base0E, bg = nil })
highlight("CmpItemKindValue", { fg = theme.base0E, bg = nil })

highlight("CmpItemKindFunction", { fg = theme.base0D, bg = nil })
highlight("CmpItemKindMethod", { fg = theme.base0D, bg = nil })
highlight("CmpItemKindConstructor", { fg = theme.base0D, bg = nil })

highlight("CmpItemKindClass", { fg = theme.base09, bg = nil })
highlight("CmpItemKindInterface", { fg = theme.base09, bg = nil })
highlight("CmpItemKindStruct", { fg = theme.base09, bg = nil })
highlight("CmpItemKindEvent", { fg = theme.base09, bg = nil })
highlight("CmpItemKindEnum", { fg = theme.base09, bg = nil })
highlight("CmpItemKindUnit", { fg = theme.base09, bg = nil })

highlight("CmpItemKindModule", { fg = theme.base0A, bg = nil })

highlight("CmpItemKindProperty", { fg = theme.base0B, bg = nil })
highlight("CmpItemKindField", { fg = theme.base0B, bg = nil })
highlight("CmpItemKindTypeParameter", { fg = theme.base0B, bg = nil })
highlight("CmpItemKindEnumMember", { fg = theme.base0B, bg = nil })
highlight("CmpItemKindOperator", { fg = theme.base0B, bg = nil })
highlight("CmpItemKindSnippet", { fg = theme.base06, bg = nil })

vim.g.colors_name = "miniature_color"

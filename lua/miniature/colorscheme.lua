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
	palette = {
		base00 = "#1b1c27",
		base01 = "#303146",
		base02 = "#444764",
		base03 = "#595c82",
		base04 = "#70749e",
		base05 = "#8f92b3",
		base06 = "#adafc7",
		base07 = "#cbcddc",
		base08 = "#f7768e",
		base09 = "#ff9e64",
		base0A = "#e0af68",
		base0B = "#9ece6a",
		base0C = "#2ac3de",
		base0D = "#7aa2f7",
		base0E = "#9d7cd8",
		base0F = "#f55673",
	},
})

local highlight = function(group, args)
	-- NOTE: using `string.format` instead of gradually growing string with `..`
	-- is faster. Crude estimate for this particular case: whole colorscheme
	-- loading decreased from ~3.6ms to ~3.0ms, i.e. by about 20%.
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

--[[
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
--]]

highlight("CmpDocumentation", { fg = theme.base05, bg = theme.base00 })
highlight("CmpDocumentationBorder", { fg = theme.base0D, bg = theme.base00 })

highlight("CmpItemAbbr", { fg = theme.base05, bg = nil })
highlight("CmpItemAbbrDeprecated", { fg = theme.base03, bg = nil, style = "strikethrough" })
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

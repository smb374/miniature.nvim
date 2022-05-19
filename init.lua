-- Options & Keymaps
require("miniature.options")
require("miniature.keymaps")

-- Autocmd
require("miniature.autocmds")

-- Plugin setup
require("miniature.plugins")
require("miniature.impatient")

-- setup all mini.nvim modules
require("miniature.colorscheme")
require("miniature.tabline")
require("miniature.statusline")
require("miniature.surround")
require("miniature.autopair")
require("miniature.indentline")
require("miniature.bufremove")
require("miniature.trailspace")
require("miniature.comment")
require("miniature.cursorword")

-- early loading plugins
require("miniature.lsp.nlspsettings")
require("miniature.treesitter")

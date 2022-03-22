vim.g.miniature_color = "atelier-cave"

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

-- Other plugins
require("miniature.alpha")
require("miniature.treesitter")
require("miniature.gitsigns")
require("miniature.cmp")
require("miniature.lsp")
require("miniature.nvim-tree")
require("miniature.diag")
require("miniature.telescope")
require("miniature.toggleterm")
require("miniature.project")

-- which-key
require("miniature.which-key")

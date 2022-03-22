vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end

-- Nvim 0.7.0+
vim.api.nvim_create_augroup("_nvim_tree", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
  desc = "nvim-tree mini.nvim setting",
  pattern = "NvimTree",
  group = "_nvim_tree",
  callback = function ()
    vim.b.ministatusline_disable = true
    vim.b.miniindentscope_disable = true
    vim.b.minicursorword_disable = true
    vim.b.minitrailspace_disable = true
  end
})

vim.api.nvim_create_augroup("_lsp_installer", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
  desc = "lsp-installer setting",
  pattern = "lsp-installer",
  group = "_lsp_installer",
  callback = function ()
    vim.b.miniindentscope_disable = true
    vim.b.minicursorword_disable = true
    vim.b.minitrailspace_disable = true
  end
})

vim.api.nvim_create_augroup("_alpha", {clear = true})
vim.api.nvim_create_autocmd("User", {
  desc = "alpha mini.nvim setting",
  pattern = "AlphaReady",
  group = "_alpha",
  callback = function ()
    vim.cmd([[set showtabline=0]])
    vim.b.ministatusline_disable = true
    vim.b.miniindentscope_disable = true
    vim.b.minicursorword_disable = true
    vim.b.minitrailspace_disable = true
  end,
})
vim.api.nvim_create_autocmd("BufUnload", {
  desc = "alpha out cmds",
  pattern = "<buffer>",
  group = "_alpha",
  command = [[set showtabline=2]],
})

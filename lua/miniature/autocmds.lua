vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
    autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
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

  augroup _statusline
    autocmd!
    autocmd FileType NvimTree,Outline,help,Neogit* let b:ministatusline_disable = v:true
    autocmd User AlphaReady let b:ministatusline_disable = v:true
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  augroup end

  augroup _indentscope
    autocmd!
    autocmd FileType NvimTree,Outline,lsp-installer,packer,help,Neogit* let b:miniindentscope_disable = v:true
    autocmd User AlphaReady let b:miniindentscope_disable = v:true
  augroup end

  augroup _cursorword
    autocmd!
    autocmd FileType NvimTree,Outline,lsp-installer,packer,help,Neogit* let b:minicursorword_disable = v:true
    autocmd User AlphaReady let b:minicursorword_disable = v:true
  augroup end

  augroup _trailspace
    autocmd!
    autocmd FileType NvimTree,Outline,lsp-installer,packer,help,Neogit* let b:minitrailspace_disable = v:true
    autocmd User AlphaReady let b:minitrailspace_disable = v:true
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0
    autocmd BufUnload <buffer> set showtabline=2
  augroup end
]])

-- -- Nvim 0.7.0+
-- local hold_action = vim.api.nvim_create_augroup("HoldAction", {})
-- local hover_showed = false
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = hold_action,
--   pattern = "*",
--   desc = "Show hover doc when CursorHold",
--   callback = function()
--     if not hover_showed then
--       vim.lsp.buf.hover()
--       hover_showed = true
--     end
--   end
-- })
-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--   group = hold_action,
--   pattern = "*",
--   callback = function()
--     if hover_showed then
--       hover_showed = false
--     end
--   end
-- })

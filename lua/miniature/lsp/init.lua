local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "miniature.lsp.lsp-installer"
require "miniature.lsp.nlspsettings"
require("miniature.lsp.handlers").setup()
require "miniature.lsp.null-ls"

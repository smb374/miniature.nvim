local present, tabline = pcall(require, "mini.tabline")
if not present then
  return
end

tabline.setup()

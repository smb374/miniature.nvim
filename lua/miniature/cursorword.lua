local present, cursorword = pcall(require, "mini.cursorword")
if not present then
  return
end

cursorword.setup({
  delay = 10,
})


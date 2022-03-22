local present, autopair = pcall(require, "mini.pairs")
if not present then
  return
end

autopair.setup({
  modes = {
    insert = true,
    command = true,
    terminal = false,
  }
})

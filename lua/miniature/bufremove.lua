local present, bufremove = pcall(require, "mini.bufremove")
if not present then
  return
end

bufremove.setup()

local present, surround = pcall(require, "mini.surround")
if not present then
  return
end

surround.setup()

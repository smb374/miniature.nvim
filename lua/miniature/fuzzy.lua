local present, fuzzy = pcall(require, "mini.fuzzy")
if not present then
  return
end

fuzzy.setup()

local present, trailspace = pcall(require, "mini.trailspace")
if not present then
  return
end

trailspace.setup({})

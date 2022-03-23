local present, trail_space = pcall(require, "mini.trail_space")
if not present then
  return
end

trail_space.setup()

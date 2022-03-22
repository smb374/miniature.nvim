local present, indentline = pcall(require, "mini.indentscope")
if not present then
  return
end

local animation = indentline.gen_animation("none")

indentline.setup({
  draw = {
    delay = 10,
    animation = animation
  },
  symbol = "│",
})

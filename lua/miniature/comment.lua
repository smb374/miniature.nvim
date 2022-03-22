local present, comment = pcall(require, "mini.comment")
if not present then
  return
end

comment.setup()

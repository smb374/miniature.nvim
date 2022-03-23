local present, neogit = pcall(require, "neogit")
if not present then
  return
end

local setup = {
  disable_hint = false,
  disable_context_highlighting = false,
  disable_signs = false,
  disable_commit_confirmation = false,
  disable_builtin_notifications = false,
  disable_insert_on_commit = true,
  use_magit_keybindings = false,
  auto_refresh = true,
  kind = "tab",
  status = {
    recent_commit_count = 10,
  },
  commit_popup = {
    kind = "split",
  },
  signs = {
    hunk = { "", "" },
    item = { "", "" },
    section = { "", "" }
  },
}

neogit.setup(setup)

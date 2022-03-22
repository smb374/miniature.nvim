local present, statusline = pcall(require, "mini.statusline")
if not present then
  return
end


local lsp_progress = function()
  local lsp = vim.lsp.util.get_progress_messages()[1]
  if lsp then
    local msg = lsp.message or ""
    local percentage = lsp.percentage or 0
    local title = lsp.title or ""
    local spinners = {
      "",
      "",
      "",
    }

    local success_icon = {
      "",
      "",
      "",
    }

    local ms = vim.loop.hrtime() / 1000000
    local frame = math.floor(ms / 120) % #spinners

    if percentage >= 70 then
      return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
    end

   return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
  end

  return ""
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local active_setup = function ()
    -- stylua: ignore start
  local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
  local git           = statusline.section_git({ trunc_width = 75 })
  local diagnostics   = statusline.section_diagnostics({ trunc_width = 75, icon = "" })
  local fileinfo      = statusline.section_fileinfo({ trunc_width = 120 })
  local location      = statusline.section_location({ trunc_width = 75 })
  local progress      = lsp_progress()
  local space         = spaces()

  local diag          = " -"

  if diagnostics ~= "" then
    diag = diagnostics
  end

  -- Usage of `MiniStatusline.combine_groups()` ensures highlighting and
  -- correct padding with spaces between groups (accounts for 'missing'
  -- sections, etc.)
  return statusline.combine_groups({
    { hl = mode_hl,                  strings = { mode:sub(1, 1), '│' } },
    { hl = mode_hl,                  strings = { git, diag } },
    '%<', -- Mark general truncate point
    { hl = 'MiniStatuslineFilename', strings = { progress } },
    '%=', -- End left alignment
    { hl = 'MiniStatuslineFilename', strings = { space } },
    { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
    { hl = mode_hl,                  strings = { location } },
  })
  -- stylua: ignore end
end

statusline.setup({
  content = {
    active = active_setup,
  }
})

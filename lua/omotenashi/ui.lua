local M = {}

function M.show_help_hint()
  vim.notify(
    "操作に迷ったら :Cheatsheet と入力すると早見表が出ます",
    vim.log.levels.INFO, {
      title = "おもてなし",
  })
end

vim.api.nvim_set_hl(0, "OmotenashiCheatsheetNormal", { bg = "#2b2440", fg = "#f5e6ff" })
vim.api.nvim_set_hl(0, "OmotenashiCheatsheetBorder", { fg = "#c9a7ff" })

local cheatsheet_lines = {
  " おもてなしチートシート ",
  "",
  "  :w         保存する",
  "  :q         終了する",
  "  :wq        保存して終了する",
  "  h j k l    カーソル移動（左 下 上 右）",
  "  i          挿入モードに入る",
  "  Esc        ノーマルモードに戻る",
  "  u          元に戻す (undo)",
  "  :Ex        ディレクトリ一覧に戻る",
  "",
  "  q か Esc でこの画面を閉じます",
}

function M.show_cheatsheet()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, cheatsheet_lines)
  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = "wipe"

  local width = 4
  for _, line in ipairs(cheatsheet_lines) do
    width = math.max(width, vim.fn.strdisplaywidth(line) + 2)
  end
  local height = #cheatsheet_lines
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    style = "minimal",
    border = "rounded",
  })

  vim.wo[win].winhighlight = "Normal:OmotenashiCheatsheetNormal,FloatBorder:OmotenashiCheatsheetBorder"

  local function close()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end

  vim.keymap.set("n", "q", close, { buffer = buf, nowait = true, silent = true })
  vim.keymap.set("n", "<Esc>", close, { buffer = buf, nowait = true, silent = true })
end

return M

local ui = require("omotenashi.ui")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    ui.show_help_hint()
  end,
})

-- 操作せず迷っている（キー入力→放置を繰り返す）様子を検知して再度ヒントを出す
vim.o.updatetime = 3000
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    ui.show_help_hint()
  end,
})

vim.api.nvim_create_user_command("Cheatsheet", function()
  ui.show_cheatsheet()
end, {})

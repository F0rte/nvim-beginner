local M = {}

function M.show_quit_hint()
  vim.notify(
    "終了するには :q と入力してください",
    vim.log.levels.INFO, {
      title = "おもてなし",
  })
end

return M

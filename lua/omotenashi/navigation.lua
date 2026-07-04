local ui = require("omotenashi.ui")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    ui.show_quit_hint()
  end,
})

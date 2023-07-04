require "Evgeniy.plug"
require "Evgeniy.keys"
require "Evgeniy.theme"
require "Evgeniy.opt"


vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

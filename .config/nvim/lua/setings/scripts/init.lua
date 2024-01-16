local M = {}

function M.start()
  local command = '~/.config/nvim/lua/setings/scripts/gopackage/main'
  local result = vim.fn.system(command)
  print(result)
end

return M

local M = {}

function M.setup()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- all  | maintained
    highlight = {enable = true}
  }
end

return M

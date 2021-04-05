local M = {}
function set_keymap()
  vim.cmd [[
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  nnoremap <leader>fq <cmd>Telescope quickfix<cr>
  nnoremap <leader>fm <cmd>Telescope marks<cr>
  nnoremap ; <cmd>Telescope git_files<cr>
  ]]
end

function M.setup()
  set_keymap()
  require'telescope'.setup{
    promptosition = "top",
    winblend = 20
  }
end

return M

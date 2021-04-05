local M = {}
function set_keymap()
  vim.cmd [[
  nnoremap <leader>gdm :Gdiff master<CR>
  nnoremap <leader>gdi :Gdiff<CR>
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gb :Gblame<CR>
  nnoremap <leader>gw :Gwrite<CR>
  nnoremap <leader>gr :Ggrep<Space>
  nnoremap <leader>gc :G commit<CR>
  ]]
end

function M.setup()
  set_keymap()
end

return M

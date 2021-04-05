require('gitsigns').setup {
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    -- is there nicer way to do these?
    ['n gj'] = {
      expr = true,
      "&diff ? 'gj' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"
    },
    ['n gk'] = {
      expr = true,
      "&diff ? 'gk' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"
    }
  }
}

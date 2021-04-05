local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                install_path)
    execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'justinmk/vim-dirvish'

    use {
      'mhinz/vim-startify',
      config = function()
        vim.g['startify_change_to_vcs_root'] = 1
        vim.g['startify_change_to_dir'] = 0
      end
    }

    use {
        'junegunn/goyo.vim',
        config = 'vim.cmd[[nnoremap <leader>o :Goyo<CR>]]'
    }

    use 'tpope/vim-repeat'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-rsi'
    use 'tpope/vim-abolish'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use {
        'tpope/vim-fugitive',
        config = function() require'plugin/fugitive'.setup() end
    }

    use 'preservim/vimux'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function() require'plugin/telescope'.setup() end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            vim.cmd [[
      TSUpdate
    ]]
        end,
        config = function() require'plugin/treesitter'.setup() end
    }

    -- js/ts [[[
    use {
        'pangloss/vim-javascript',
        opt = true,
        ft = {'javascript', 'typescript', 'typescriptreact'}
    }
    use {
        'MaxMEllon/vim-jsx-pretty',
        opt = true,
        ft = {'javascript', 'typescript', 'typescriptreact'}
    }
    use {
        'HerringtonDarkholme/yats.vim',
        opt = true,
        ft = {'javascript', 'typescript', 'typescriptreact'}
    }
    use {
        'windwp/nvim-ts-autotag',
        opt = true,
        ft = {'javascript', 'typescript', 'typescriptreact'},
        requires = {'nvim-treesitter/nvim-treesitter'},
        config = function() require('nvim-ts-autotag').setup() end
    }
    use {
        'neoclide/coc.nvim',
        branch = 'release',
        opt = true,
        ft = {'javascript', 'typescript', 'typescriptreact'},
        run = function()
          vim.cmd [[
          CocInstall coc-tsserver
          CocInstall coc-eslint
          ]]
        end,
        config = function() require'plugin/coc'.setup() end
    }
    -- ]]]

    use {
        'TimUntersberger/neogit',
        config = function()
            local neogit = require('neogit')
            neogit.setup {}
        end
    }

    use {
        "npxbr/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"},
        config = function()
            vim.g['gruvbox_contrast_dark'] = 'soft'
            vim.cmd [[colo gruvbox]]
        end
    }

    use {
        'savq/melange'
        -- config = 'vim.cmd[[colo melange]]'
    }

    use "tversteeg/registers.nvim"

    use {
        'npxbr/glow.nvim',
        opt = true,
        ft = 'markdown',
        config = 'vim.cmd [[ nnoremap <leader>p :Glow<CR> ]]'
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
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
        end
    }

    use {
        'edluffy/specs.nvim',
        config = function()
            require('specs').setup {
                show_jumps = true,
                min_jump = 30,
                popup = {
                    delay_ms = 0, -- delay before popup displays
                    inc_ms = 10, -- time increments used for fade/resize effects
                    blend = 40, -- starting blend, between 0-100 (fully transparent), see :h winblend
                    width = 10,
                    winhl = "PMenu",
                    fader = require('specs').linear_fader,
                    resizer = require('specs').shrink_resizer
                }
            }
        end
    }

    use 'AndrewRadev/splitjoin.vim' -- gJ gS, could treesitter do something like this?

end)

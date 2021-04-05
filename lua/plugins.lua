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
      config = [[require'config.startify']],
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
        config = [[require'config.fugitive']]
    }

    use 'preservim/vimux'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = [[require'config.telescope']],
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = [[require'colorizer'.setup()]],
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = 'vim.cmd [[ TSUpdate ]]',
        config =  [[require'config.treesitter']],
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
        requires = { 'nvim-treesitter/nvim-treesitter' },
        config = [[require('nvim-ts-autotag').setup()]]
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
        config = [[require'config.coc']]
    }
    -- ]]]

    use {
        'TimUntersberger/neogit',
        config = [[require('neogit').setup{}]]
    }

    use {
        "npxbr/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"},
        config = [[require'config.gruvbox']],
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
        config = [[require'config.gitsigns']]
      }

    use {
        'edluffy/specs.nvim',
        config = [[require'config.specs']]
    }

    use 'AndrewRadev/splitjoin.vim' -- gJ gS, could treesitter do something like this?

end)

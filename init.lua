-- Set options
vim.o.number = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.mouse = "a"

-- Plugin configuration
local packer = require('packer')

packer.startup(function()
	use 'wbthomason/packer.nvim'
    use 'http://github.com/tpope/vim-surround' -- Surrounding ysw
    use 'https://github.com/preservim/nerdtree' -- NerdTree
    use 'https://github.com/tpope/vim-commentary' -- For Commenting gcc & gc
    use 'https://github.com/vim-airline/vim-airline' -- Status bar
    use 'vim-airline/vim-airline-themes'
    use 'https://github.com/ap/vim-css-color' -- CSS Color Preview
    use 'https://github.com/rafi/awesome-vim-colorschemes' -- Retro Scheme
    use 'https://github.com/ryanoasis/vim-devicons' -- Developer Icons
    use 'https://github.com/tc50cal/vim-terminal' -- Vim Terminal
    use 'https://github.com/terryma/vim-multiple-cursors' -- CTRL + N for multiple cursors
    use 'https://github.com/preservim/tagbar' -- Tagbar for code navigation
    use 'https://github.com/neoclide/coc.nvim' -- Auto Completion
    use 'jiangmiao/auto-pairs' -- Auto-pairs
    use 'https://github.com/dinhhuy258/git.nvim' -- Git commands in nvim commands
    use 'https://github.com/907th/vim-auto-save' -- Autosave
    use 'nvim-lua/plenary.nvim'
    use {'nvim-telescope/telescope.nvim', tag = '0.1.1'} -- Fuzzy Finder
	use {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup({
    theme = 'hyper',
    config = {
      week_header = {
       enable = true,
      },
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Apps',
          group = 'DiagnosticHint',
          action = 'Telescope app',
          key = 'a',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope dotfiles',
          key = 'd',
        },
      },
    },
  })  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}
use {
  "AckslD/nvim-neoclip.lua",
  requires = {
    {'kkharji/sqlite.lua', module = 'sqlite'},
    -- you'll need at least one of these
    {'nvim-telescope/telescope.nvim'}
    -- {'ibhagwan/fzf-lua'},
  },
  config = function()
    require('neoclip').setup()
  end,
}
	use 'L3MON4D3/LuaSnip'
	use 'Exafunction/codeium.vim'
  end)

-- Set colorscheme
vim.cmd('colorscheme gruvbox')
vim.g.airline_theme = "base16_gruvbox_dark_hard"

-- Key mappings
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFocus<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':call CocActionAsync("jumpDefinition")<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':TagbarToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', ':w !python<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { silent = true })

-- Terminal settings
vim.g.python3_host_prog = '/usr/bin/python'

-- Enable Coc for HTML and CSS
vim.cmd('autocmd FileType html,css setlocal formatexpr=CocActionAsync("formatSelected")')
vim.cmd('autocmd FileType html,css setlocal formatprg=prettier\\ --stdin-filepath\\ %')

-- Enable auto-pairs
vim.g.auto_pairs_map_keys = 1

-- Enable "fast wrap" feature (optional)
vim.g.AutoPairsShortcutToggle = '<M-e>'
vim.g.AutoPairsShortcutFastWrap = '<M-a>'

-- Auto-save settings
vim.g.auto_save = 1
vim.g.auto_save_silent = 1

-- Linux clipboard settings (using xclip)
vim.cmd('set clipboard+=unnamedplus')


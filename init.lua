-- Setup runtimepath and packpath to include ~/.vim directory.
-- Set the vim directory as the first directory to search into and the after
-- directory as the last to search into.
--vim.opt.packpath = vim.opt.packpath:prepend({'~/.vim'}):append({'~/.vim/after'})

-- Setting up early so mappings with <leader> use the this value.
vim.g.mapleader = ' '

require('cstm.basic')
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
require('lualine').setup({})


vim.opt.termguicolors = true
vim.g.tokyonight_style = "night"
vim.cmd("colorscheme melange")

-- Fixes confusing highlighting on brackets and other surrounding characters.
vim.cmd([[highlight MatchParen gui=bold guibg=NONE guifg=blue cterm=bold ctermbg=NONE]])

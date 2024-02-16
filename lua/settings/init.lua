require('settings.nvim-treesitter')
require('settings.lsp-colors')
require('settings.nvim-cmp')
require('settings.lspkind')
require('settings.lspsaga')

require('colorizer').setup()
require('hlchunk').setup({})
--[[
   [ require('dropbar.config').setup({
   [     opts.icons = {
   [         enable = true,
   [         kinds = {
   [             use_devicons = false,
   [         },
   [     },
   [ })
   ]]

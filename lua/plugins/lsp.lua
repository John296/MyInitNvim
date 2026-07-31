vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig"
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('pylsp')

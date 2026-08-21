vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig"
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('pylsp')

vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lf', function()
    vim.lsp.buf.code_action({
        apply = true,
        context = {
            only = { "source.organizeImports", "quickfix" },
        },
    })
end, { noremap = true, silent = true })

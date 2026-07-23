vim.pack.add({
    "https://github.com/rachartier/tiny-inline-diagnostic.nvim"
})

require('tiny-inline-diagnostic').setup({
    options = {
        virtual_text = false,
        update_in_insert = false,
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "●",
                [vim.diagnostic.severity.WARN] = "●",
                [vim.diagnostic.severity.INFO] = "●",
                [vim.diagnostic.severity.HINT] = "●",
            },
        },
        severity_sort = true,
    }
})

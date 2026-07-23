vim.pack.add({
    "https://github.com/shellRaining/hlchunk.nvim"
})

require('hlchunk').setup({
    chunk = {
        enable = true,
    },

    indent = {
        enable = true,
        chars = {
            "│",
            "¦",
            "┆",
            "┊",
        },
    },
})

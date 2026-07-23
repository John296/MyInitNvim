vim.pack.add({
    "https://github.com/tpope/vim-surround",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/jiangmiao/auto-pairs",
    "https://github.com/preservim/nerdcommenter",
    "https://github.com/nvim-zh/better-escape.vim",
    "https://github.com/lfv89/vim-interestingwords",
})

vim.keymap.set("n", "<leader>b", "<Cmd>call InterestingWords('n')<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>v", "<Cmd>call UncolorAllWords()<CR>", { noremap = true, silent = true })

vim.pack.add({
    "https://github.com/nvim-tree/nvim-tree.lua"
})

require("nvim-tree").setup({
})

vim.keymap.set("n", "<F2>", "<Cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

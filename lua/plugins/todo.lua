vim.pack.add({
    "https://github.com/John296/todo.nvim",
})

require("todo").setup({
    labels = { 'todo', 'fixme', 'question', 'idea' },
    prefix = '@',
})

vim.keymap.set("n", "<leader>td", "<Cmd>lua require('todo').list()<CR>", { noremap = true, silent = true })

vim.pack.add({
    "https://github.com/CRAG666/betterTerm.nvim"
})

require("betterTerm").setup({
    show_tabs = false,
})

local betterTerm = require("betterTerm")

vim.keymap.set({"n", "t"}, "<leader>tt", function() betterTerm.open() end, { desc = "Toggle terminal" })

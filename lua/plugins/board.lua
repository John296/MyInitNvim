vim.pack.add({
    "https://github.com/nvimdev/dashboard-nvim"
})

require("dashboard").setup({
    config = {
        week_header = { enable = true, },

        shortcut = {
                  { desc = '[  John]', group = 'DashboardShortCut' },
        },

        project = { enable = false, },
    },
})

vim.keymap.set("n", "<leader>ts", "<Cmd>Dashboard<CR>", { noremap = true, silent = true })

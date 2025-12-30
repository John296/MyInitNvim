require("blink.cmp").setup({
    -- keymap = { preset = 'super-tab'},
    keymap = {
        ['<tab>'] = {
            'select_next',
            fallback = 'accept',
        },

        ['<S-tab>'] = {
            'select_prev',
            fallback = 'accept',
        },
    },

    appearance = {
        nerd_font_variant = "mono",
    },

    completion = {
        documentation = { auto_show = false },
        list = {
            selection = {
                preselect =  false,
                auto_insert = true,
            },
        },
    },

    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = { implementation = "lua" },
})

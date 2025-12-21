local colors = {
    dark_gray   = '#303030',
    med_gray_hi = '#444444',
    med_gray_lo = '#3a3a3a',
    light_gray  = '#b2b2b2',
    green       = '#b8bb26',
    blue        = '#83a598',
    purple      = '#881798',
    orange      = '#d7af5f',
    red         = '#fb4934',
    pink        = '#d7afd7',
}

local my_theme = {
    normal = {
        a = { fg = colors.dark_gray, bg = colors.green },
        b = { fg = colors.light_gray, bg = colors.med_gray_lo },
        c = { fg = colors.green, bg = colors.med_gray_hi },
    },

    insert = {
        a = { fg = colors.med_gray_hi, bg = colors.blue },
        c = { fg = colors.blue, bg = colors.med_gray_hi },
    },

    visual = {
        a = { fg = colors.dark_gray, bg = colors.pink },
        c = { fg = colors.pink, bg = colors.med_gray_hi },
    }
}

local function location()
  local line = vim.fn.line('.')
  local col = vim.fn.charcol('.')
  return string.format(' %d%-2d', line, col)
end

local function mode()
    local mode_map = {
        c = 'C',
        n = 'N',
        ni = 'N',
        no = 'N',
        i = 'I',
        ic = 'I',
        ix = 'I',
        v = 'V',
        V = 'V',
        ["\22"] = 'V', -- V-BLOCK, ^V:<C-v>
    }

    return mode_map[vim.fn.mode()] or '[UKN]'

end

require("lualine").setup({
    options = {
        theme = my_theme,
        -- component_separators = { left = '', right = '' },
        component_separators = '',
        section_separators = { left = '', right = '', },
        icon = { align = 'right', },
        path = 2,
        shorting_target = 100,
    },

    always_show_tabline = true,

    sections = {
        lualine_a = { mode },
        lualine_b = { { 'FugitiveHead', icon = '' }, },
        lualine_c = {
            { 'filename', file_status = false, },
        },
        lualine_x = {
            { 'filetype' },
        },
        lualine_y = {
            { 'encoding', separator = { left = '' }, },
            { 'fileformat', separator = { left = '' }, },
        },
        lualine_z = {
            { '%p%%' },
            { location },
            {
                'diagnostics',
                source = { 'nvim' },
                sections = { 'warn' },
                diagnostics_color = { warn = { fg = colors.dark_gray, bg = colors.orange }, },
                separator = { left = '' },
            },
            {
                'diagnostics',
                source = { 'nvim' },
                sections = { 'error' },
                diagnostics_color = { error = { fg = colors.dark_gray, bg = colors.red }, },
                separator = { left = '' },
            },
        },
    },

    tabline = {
        lualine_a = {
            {
                'buffers',
                separator = { right = '' },
                buffers_color = {
                    active = {
                        fg = colors.dark_gray,
                        bg = colors.green,
                    },
                    inactive = {
                        fg = colors.light_gray,
                        bg = colors.med_gray_lo,
                    },
                },
            },
        },
    },
})

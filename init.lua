vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = vim.fn.stdpath("config") .. "/init.lua",
	callback = function()
		vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
	end,
})

vim.cmd([[filetype plugin indent on]])

vim.opt.fileencodings = { "utf8", "gb2312", "gb18030", "gbk", "ucs-bom", "cp936", "latin1" }
vim.opt.encoding = "utf8"
vim.opt.autochdir = true
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.confirm = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.foldenable = false
vim.opt.list = true
vim.opt.listchars = { tab = "»■", trail = "■" }

vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse = "a"

vim.opt.background = "dark"
vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.cinoptions = "{0, 1s, t0, n-2, p2s, (03s, =.5s, >1s, :1s"
vim.opt.smartindent = true

vim.opt.textwidth = 80
vim.opt.scrolloff = 5

vim.opt.wildmenu = true

vim.cmd([[syntax enable]])
vim.cmd([[syntax on]])

vim.g.mapleader = ","

require("plugins.smear-cursor")
require("plugins.vimplugins")
require("plugins.diagnostic")
require("plugins.blink_cmp")
require("plugins.hlchunk")
require("plugins.lualine")
require("plugins.dropbar")
require("plugins.noice")

local map = vim.keymap.set

map("i", "jj", "<ESC>", { noremap = true, silent = true })
map("n", "<leader>s", "<Cmd>w<CR>", { noremap = true, silent = true })
map("n", "<leader>q", "<Cmd>q<CR>", { noremap = true, silent = true })
map("n", "<leader>x", "<Cmd>bd<CR>", { noremap = true, silent = true })
map("n", "<leader>c", "<C-w>c", { noremap = true, silent = true })
map("n", "<leader>m", "<Cmd>nohlsearch<CR>", { noremap = true, silent = true })
map("n", "<leader>w", "<Cmd>set splitright<CR>:vsplit<CR>", { noremap = true, silent = true })

map("n", "gn", "<Cmd>bnext<CR>:lcd %:p:h<CR>", { noremap = true, silent = true })
map("n", "gp", "<Cmd>bprevious<CR>:lcd %:p:h<CR>", { noremap = true, silent = true })

vim.cmd("colorscheme wildcharm")

-- autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
-- autocmd InsertLeave * if pumvisible() == 0|pclose|endif

vim.cmd("highlight  CursorLine guifg=NONE guibg=#3a3d4d guisp=#3a3d4d ctermbg=236")
vim.cmd("highlight  CursorLine guifg=NONE guibg=#3a3d4d guisp=#3a3d4d ctermbg=236")
vim.cmd("highlight  CursorLineNr          guibg=NONE   ctermbg=NONE   cterm=NONE")
vim.cmd("highlight  LineNr                guibg=NONE   ctermbg=NONE")
vim.cmd("highlight  SignColumn            guibg=NONE   ctermbg=NONE")
vim.cmd("highlight  DiffAdd               guibg=NONE   ctermbg=NONE")
vim.cmd("highlight  DiffDelete            guibg=NONE   ctermbg=NONE")
vim.cmd("highlight  DiffChange            guibg=NONE   ctermbg=NONE")
vim.cmd("highlight  SignifyLineDelete     guibg=NONE   ctermbg=NONE")
vim.cmd("highlight  SignifyLineChange     guibg=NONE   ctermbg=NONE")
vim.cmd("highlight  Normal                guibg=NONE   ctermbg=NONE")
vim.cmd("highlight  StatusLine            gui=NONE")

local function compile_run_gcc()
    vim.cmd("w")

    local ft = vim.bo.filetype
    local fname = vim.fn.expand("%")
    local froot = vim.fn.expand("%:r")

    if ft == "c" or ft == "cpp" then
        vim.fn.system(string.format("g++ %s -o %s", fname, froot))
    elseif ft == "python" then
        vim.fn.system(string.format("python %s", fname))
    elseif ft == "lua" then
        vim.fn.system(string.format("lua %s", fname))
    elseif ft == "cmake" then
        vim.fn.system(string.format("cmake -P %s", fname))
    elseif ft == "sh" then
        vim.fn.system(string.format("time bash %s", fname))
    else
        print("Unsupported filetype for quick run!")
    end
end

map("n", "<leader>r", compile_run_gcc, { noremap = true, silent = false })

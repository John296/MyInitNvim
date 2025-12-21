autocmd BufWritePost $MYVIMRC source $MYVIMRC
filetype indent on
set fileencodings=utf8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set encoding=utf8
set autochdir
set autoread
set nobackup
set confirm
set number
set relativenumber
set cursorline
set wrap
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
set nofoldenable
set listchars=tab:»■,trail:■
set list

set clipboard+=unnamedplus
set mouse=a

set background=dark
set termguicolors

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set cindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,:1s
set smartindent

set textwidth=80
set scrolloff=5

set wildmenu
set rtp+=/opt/homebrew/opt/fzf

syntax enable
syntax on

let mapleader=","

inoremap jj <ESC>
nmap <leader>s :w<CR>
nmap <leader>q :q<CR>
nmap <leader>x :bd<CR>
nmap <leader>c <C-w>c
nmap <leader>m :nohlsearch<CR>
nmap <leader>w :set splitright<CR>:vsplit<CR>

nnoremap gn :bnext<CR>:lcd %:p:h<CR>
nnoremap gp :bprevious<CR>:lcd %:p:h<CR>

if has("win32")
    call plug#begin('~/AppData/Local/nvim/plugged')
else
    call plug#begin('~/.config/nvim/plugged')
endif
Plug 'morhetz/gruvbox'
Plug 'john296/vim-todo'
Plug 'junegunn/fzf', { 'do': {-> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'APZelos/blamer.nvim'
Plug 'Bekaboo/dropbar.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/vim-markdown'
Plug 'preservim/nerdcommenter'
" Plug 'vim-airline/vim-airline'
Plug 'jdhao/better-escape.vim'
Plug 'vim-python/python-syntax'
Plug 'nvim-lualine/lualine.nvim'
Plug 'shellRaining/hlchunk.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'lfv89/vim-interestingwords'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'vim-airline/vim-airline-themes'
Plug 'eandrju/cellular-automaton.nvim'
Plug 'rachartier/tiny-inline-diagnostic.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'
" Plug 'nvim-treesitter/nvim-treesitter', { 'do' : ':TSUpdate' }
"""
Plug 'neovim/nvim-lspconfig'
Plug 'saghen/blink.cmp'
"""
Plug 'folke/noice.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neotest/nvim-nio'
Plug 'voldikss/vim-floaterm'
Plug 'ryanoasis/vim-devicons'
Plug 'sphamba/smear-cursor.nvim'
"""
call plug#end()

color gruvbox

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

nnoremap <silent> <leader>b :call InterestingWords('n')<CR>
nnoremap <silent> <leader>v :call UncolorAllWords()<CR>

let g:python_highlight_all=1
let g:loaded_python_provider=0
let g:fzf_layout={'down': '40%'}
let g:better_escape_shortcut='jj'
let g:NERDTreeDirArrowExpanbblEdable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:fzf_preview_window=['right:40%', 'ctrl-/']
let g:startify_custom_header='startify#pad(startify#fortune#boxed())'
let g:spacevim_todo_labels=map(['todo', 'question', 'idea', 'fixme', 'mark'], '"@" . v:val')

if has("win32")
    let g:vsnip_snippet_dir = expand('~/AppData/Local/nvim/.vsnip')
else
    let g:vsnip_snippet_dir = expand('~/.config/nvim/.vsnip')
endif

let g:NERDSpaceDelims=1

lua <<EOF
require('settings')
vim.lsp.enable({"lua_ls", "clangd", "pylsp"})

local map = vim.keymap.set

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspKeymap", {}),
    callback = function(ev)
        local opts = function(desc)
            return { buffer = ev.buf, desc = desc }
        end

        map("n", "K", vim.lsp.buf.hover, opts("LSP Hover"))
        map("n", "gd", vim.lsp.buf.definition, opts("Goto Definition"))
        map("n", "gD", vim.lsp.buf.declaration, opts("Goto Declaration"))
        map("n", "gr", vim.lsp.buf.references, opts("List References"))
        map("n", "gi", vim.lsp.buf.implementation, opts("Goto Implementation"))
        map("n", "gt", vim.lsp.buf.type_definition, opts("Type Definition"))
        map("n", "gx", vim.lsp.buf.code_action, opts("Code Action"))
    end,
    })

-- 配置 diagnostic 显示
vim.diagnostic.config({
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
})

EOF

map <leader>f <Plug>(easymotion-bd-w)
map <leader>L <Plug>(easymotion-bd-jk)
" nmap <leader>f <Plug>(easymotion-overwin-w)
" nmap <leader>L <Plug>(easymotion-overwin-line)
nnoremap <F2> :NERDTreeToggle<CR>

nnoremap <leader>td :OpenTodo<CR>
nnoremap <leader>ts :Startify<CR>
nnoremap <leader>tn :FloatermNew<CR>
nnoremap <leader>tt :FloatermToggle<CR>


highlight  CursorLine          guifg=NONE   guibg=#3a3d4d  guisp=#3a3d4d  ctermbg=236
highlight  LineNr              guibg=NONE   ctermbg=NONE
highlight  CursorLineNr        guibg=NONE   ctermbg=NONE   cterm=NONE
highlight  SignColumn          guibg=NONE   ctermbg=NONE
highlight  DiffAdd             guibg=NONE   ctermbg=NONE
highlight  DiffDelete          guibg=NONE   ctermbg=NONE
highlight  DiffChange          guibg=NONE   ctermbg=NONE
highlight  SignifyLineDelete   guibg=NONE   ctermbg=NONE
highlight  SignifyLineChange   guibg=NONE   ctermbg=NONE
highlight  Normal              guibg=NONE   ctermbg=NONE
highlight  StatusLine          gui=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BufferCloseOthers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! BufCloseOthers call BufCloseOthers()
function! BufCloseOthers()

let l:currentBufNum = bufnr("%")
let l:alternateBufNum = bufnr("#")

for i in range(1,bufnr("$"))
    if buflisted(i)
        if i!=l:currentBufNum
            execute("bdelete ".i)
        endif
    endif
endfor

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly Run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>r :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!g++ % -o %<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
    elseif &filetype == 'python'
        exec '!python %'
    elseif &filetype == 'lua'
        exec '!lua %'
    elseif &filetype == 'cmake'
        exec '!cmake -P %'
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

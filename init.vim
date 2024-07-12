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
Plug 'preservim/nerdcommenter'
Plug 'APZelos/blamer.nvim'
Plug 'Bekaboo/dropbar.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jdhao/better-escape.vim'
Plug 'vim-python/python-syntax'
Plug 'shellRaining/hlchunk.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'lfv89/vim-interestingwords'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'eandrju/cellular-automaton.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do' : ':TSUpdate' }
"""
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind-nvim'
Plug 'tami5/lspsaga.nvim'
Plug 'folke/lsp-colors.nvim'
"""
Plug 'ryanoasis/vim-devicons'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'rcarriga/nvim-notify'
Plug 'theHamSta/nvim-dap-virtual-text'
Plug 'voldikss/vim-floaterm'
"""
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
"""
call plug#end()

color gruvbox

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

nnoremap <silent> <leader>b :call InterestingWords('n')<CR>
nnoremap <silent> <leader>v :call UncolorAllWords()<CR>

let g:airline_filetype_overrides = {
            \ 'coc-explorer':  [ 'CoC Explorer', '' ],
            \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
            \ 'fugitive': ['', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
            \ 'floggraph':  [ 'Flog', '%{get(b:, "flog_status_summary", "")}' ],
            \ 'gundo': [ 'Gundo', '' ],
            \ 'help':  [ '', '%f' ],
            \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
            \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', ''), '' ],
            \ 'startify': [ '', '' ],
            \ 'vim-plug': [ '', '' ],
            \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
            \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
            \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
            \ }

let g:airline_mode_map = {
            \ '__'     : '-',
            \ 'c'      : 'C',
            \ 'i'      : 'I',
            \ 'ic'     : 'I',
            \ 'ix'     : 'I',
            \ 'n'      : 'N',
            \ 'multi'  : 'M',
            \ 'ni'     : 'N',
            \ 'no'     : 'N',
            \ 'R'      : 'R',
            \ 'Rv'     : 'R',
            \ 's'      : 'S',
            \ 'S'      : 'S',
            \ '^S'     : 'S',
            \ 't'      : 'T',
            \ 'v'      : 'V',
            \ 'V'      : 'V',
            \ '^V'     : 'V',
            \ }

let g:python_highlight_all=1
let g:loaded_python_provider=0
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:fzf_layout={'down': '40%'}
let g:better_escape_shortcut='jj'
let g:airline_stl_path_style='short'
let g:NERDTreeDirArrowExpanbblEdable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:airline#extensions#tabline#enabled=1
let g:fzf_preview_window=['right:40%', 'ctrl-/']
let g:startify_custom_header='startify#pad(startify#fortune#boxed())'
let g:spacevim_todo_labels=map(['todo', 'question', 'idea', 'fixme', 'mark'], '"@" . v:val')

if has("win32")
    let g:vsnip_snippet_dir = expand('~/AppData/Local/nvim/.vsnip')
else
    let g:vsnip_snippet_dir = expand('~/.config/nvim/.vsnip')
endif

let g:NERDSpaceDelims=1

let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

let g:airline_left_sep = "\uE0B4"
let g:airline_left_alt_sep = "\uE38E"
let g:airline_right_sep = "\uE0B6"
let g:airline_right_alt_sep = "\uE0B7"
let g:airline_symbols.branch = "\uF418"
let g:airline_symbols.colnr = "\uF142"
let g:airline_symbols.linenr = " \uF44E "
let g:airline_symbols.maxlinenr = " "
let g:airline_symbols.readonly = "\uF023"
let g:airline#extensions#nvimlsp#error_symbol = "\uF057 "
let g:airline#extensions#nvimlsp#warning_symbol = "\uF06A "

" vim-cpp-modern settings
" Enable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

lua require('settings')

map <leader>f <Plug>(easymotion-bd-w)
map <leader>L <Plug>(easymotion-bd-jk)
nmap <leader>f <Plug>(easymotion-overwin-w)
nmap <leader>L <Plug>(easymotion-overwin-line)
nnoremap <F2> :NERDTreeToggle<CR>

nnoremap <leader>do :lua require("dapui").open()<CR>
nnoremap <leader>dc :lua require("dapui").close()<CR>
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

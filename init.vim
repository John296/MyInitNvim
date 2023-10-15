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
Plug 'nvim-treesitter/nvim-treesitter', { 'do' : ':TSUpdate' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
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
nnoremap ts :Startify<CR>
nnoremap <leader>t :OpenTodo<CR>
nnoremap <F2> :NERDTreeToggle<CR>


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
        exec '! python %'
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=============================================================================
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
"=============================================================================

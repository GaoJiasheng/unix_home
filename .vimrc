let mapleader = ','
"不要兼容vi
set nocompatible

" Make command line two lines high"
set ch=2
set ts=4
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,gbk,gb2312
set fileformats=unix
set scrolloff=3
set foldnestmax=2

set hlsearch incsearch
"set ignorecase smartcase

set number
set autoindent
set showmatch
set noshowmode
set ttyfast
set ruler

set autoread
set backspace=indent,eol,start


"自动换行
set wrap
"去除左右两边的滚动条
set go-=r
set go-=L

"打开高亮
syntax enable

set fdm=syntax
"key maps
map <C-T> :tabnew<CR>
map <C-N> :tabnext<CR>
map <C-P> :tabpre<CR>

nnoremap <leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <leader>, :tabnew <C-R>=expand('%:p:h') . '/'<CR>
inoremap jj <Esc>
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <C-H> :set hls<CR><C-L>

"tagbar
nmap <leader>t :TagbarToggle<CR>

"ctags
"set tags=./.git/tags;./tags;~/.vim/tags;
set tags=./ctags;~/.vim/ctags;
"set autochdir

"屏蔽掉讨厌的F1键
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"取消粘贴缩进
nmap <leader>p :set paste<CR>
nmap <leader>pp :set nopaste<CR>

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-f> <right>
inoremap <c-b> <left>
inoremap <c-a> <home>
inoremap <c-e> <end>
"esc的映射
imap jj <esc>


nnoremap Y y$

"设置NERDTree
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeMouseMode=2
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
let NERDTreeDirArrows=1
let g:NERDTreeDirArrowCollapsible=1
let g:NERDTreeDirArrowExpandable=1

map <C-C> :NERDTreeFind<CR>
map <C-C> :NERDTreeToggle<CR>

"设置taglist
let Tlist_Show_One_File=1 "只显示当前文件的tag
let Tlist_Exit_OnlyWindow=1 "如果taglist窗口是最后一个窗口则退出vim
let Tlist_Use_Right_Window=1 "右侧现实taglist
let Tlist_GainFocus_On_ToggleOpen=1 "自动聚焦到taglist
map <C-X> :TlistToggle<CR>

"设置gocode
map <C-M> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

"powerline
set laststatus=2
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'unicode'
let g:showmarks_enable = 0
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyz".
                        \ "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_textlower = " "
let g:showmarks_textupper = " "
let g:showmarks_textother = " "
let g:showmarks_hlline_lower = 1
let g:showmarks_hlline_upper = 1
let g:showmarks_hlline_other = 1

"tab键显示待选项
set wildmenu


set t_Co=256
"设置光标高亮显示
set cursorline    "same as set cul
set cursorcolumn  "same as set cuc
hi CursorLine term=bold cterm=bold "guibg=0 ctermbg=235
hi CursorColumn term=bold cterm=bold "guibg=0 ctermbg=235
"toggle hi of cuc and cul
nnoremap H :set cursorline! cursorcolumn!<CR>

"""""""""""""""""""""""""""""""""""COLOR SCHEMA"""""""""""""""""""""""
"colorscheme pablo
"colorscheme desert
"colorscheme candy
"colorscheme vividchalk
"colorscheme perfectdark
"colorscheme Dracula
colorscheme onedark

"""""""molokai相关设置
"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
""""""""""""""""""""""

"""""""solarized相关设置
"colorscheme solarized
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"""""""""""""""""""""""

if has('gui_running')
     set background=dark
     set transparency=5
     "set lines=60
     "set columns=190
     set guifont=Monaco:h15
     set t_Co=256
else
     set background=dark
endif
"""""""""""""""""""""""""""""""""""COLOR SCHEMA"""""""""""""""""""""""

"将-连接符也设置为单词
set isk+=-

"自动载入配置文件不需要重启
"autocmd! bufwritepost _vimrc source %
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"行号自动跳转
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


"vim 插件管理
"git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
filetype off        " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"let Vundle manage Vundle
"required!
Bundle 'gmarik/vundle'
Bundle 'ZenCoding.vim'
Bundle 'matchit.zip'
Bundle 'ShowTrailingWhitespace'
Bundle '_jsbeautify'
Bundle 'EasyMotion'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'snipMate'
Bundle 'bufexplorer.zip'
Bundle 'taglist.vim'
Bundle 'OmniCppComplete'
Bundle 'https://github.com/Lokaltog/vim-powerline'
Bundle 'https://github.com/Shougo/neocomplcache.git'
Bundle 'Blackrush/vim-gocode'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'fatih/vim-go'
Bundle 'SirVer/ultisnips'
Bundle 'majutsushi/tagbar.git'
Bundle 'Shougo/neocomplete.vim.git'
Bundle 'Valloric/YouCompleteMe'
Bundle 'jistr/vim-nerdtree-tabs.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'mattn/emmet-vim'

"auto complete
let g:neocomplcache_enable_at_startup=1

"必须的设置：
filetype on
filetype plugin indent on
filetype plugin on

syntax on


set mouse=a
syntax on

"Golang config
au FileType go nmap <C-]>	gd
au FileType go nmap <C-g> <Plug>(go-def-vertical)
let g:fencview_autodetect=1
let g:go_disable_autoinstall = 0
let g:neocomplete#enable_at_startup = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:godef_split=3
au BufRead,BufNewFile *.go set filetype=go

"fold set

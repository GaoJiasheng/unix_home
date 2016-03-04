set nocompatible              " be iMproved
set nu
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

"vim插件管理
Bundle 'gmarik/vundle' 
Bundle 'Lokaltog/vim-powerline'
"Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'fatih/vim-go'
Bundle 'majutsushi/tagbar.git'
Bundle 'Valloric/YouCompleteMe'
Bundle 'jistr/vim-nerdtree-tabs.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'vim-scripts/AutoClose'
"Bundle 'SirVer/ultisnips'
"Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-surround'
"Bundle 'plasticboy/vim-markdown.git'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
"Bundle 'tpope/vim-rails.git'



call vundle#end()            " required
filetyp plugin indent on     " required!


" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

"打开高亮
syntax enable
syntax on

""set fdm=syntax

""key maps
map <C-T> :tabnew<CR>
map <C-N> :tabnext<CR>
map <C-P> :tabpre<CR>

"共享剪贴板数据
set clipboard+=unnamed 
""""

"go相关的配置
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

"airline
let g:airline#extensions#tabline#enabled = 1

"markdown
let g:vim_markdown_frontmatter=1

"全局设置
set shell=/bin/bash
set hlsearch
set mouse=a
set cuc cul  "这个就是十字架
set incsearch
set autoindent
set smartindent
set showmatch
set ruler
set wrap
set softtabstop=4
set ts=4
set expandtab
set shiftwidth=4
set ignorecase "大小写敏感
set ignorecase "大小写敏感
setlocal noswapfile 
set bufhidden=hide 
"颜色方案 
"https://github.com/tomasr/molokai/
"文件放到~/.vim/colors/molokai.vim

"colorscheme  molokai

"""""""solarized相关设置
colorscheme solarized
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
"""""""""""""""""""""""

if has('gui_running')
     set background=dark
     set transparency=5
     "set lines=60
     "set columns=190
     set guifont=Monaco:h12
     set t_Co=256
else
     set background=dark
endif


" 设置NerdTree
map <C-c> :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeMouseMode=2
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.swp','\.pyc', '\.mod\.c', '\.o', '\.ko', '\.a', '\.so', 'CMakeFiles', '\.cmake', 'CMakeCache.txt']
"}}}


"
let g:syntastic_cpp_compiler_options = ' -std=c++11'


" YCM{{{
" youcompleteme  默认tab  s-tab 和自动补全冲突
" let g:ycm_key_list_select_completion=['<c-n>']
" let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_previous_completion=['<c-p>']
" let g:ycm_key_list_previous_completion = ['<Up>']
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_confirm_extra_conf = 0      "关闭加载.ycm_extra_conf.py提示
let g:ycm_complete_in_comments = 1    "在注释输入中也能补全
let g:ycm_complete_in_strings = 1     "在字符串输入中也能补全
let g:ycm_seed_identifiers_with_syntax = 1                  " 语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
let g:ycm_min_num_of_chars_for_completion = 1               " 从第2个键入字符就开始罗列匹配项
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_warning_symbol = '>>'
let g:ycm_error_symbol = '->'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
nnoremap <leader>gh :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" mapping
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>" 
" YCM settings

"ctags tagbar相关配置
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
nmap <CR> :TagbarToggle<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.go,*.py,*.txt call tagbar#autoopen()

"ctags
"let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
"let Tlist_Show_One_File = 1 
"let Tlist_Exit_OnlyWindow = 1 
"let Tlist_Use_Left_Window = 0 
"let Tlist_Sort_Type = 'name' 
"let Tlist_Auto_Open = 1 
"let Tlist_Auto_Update = 1 
"let Tlist_WinWidth = 25 
"let Tlist_Use_Right_Window= 1 
"let Tlist_File_Fold_Auto_Close=1 


"屏蔽掉讨厌的F1键
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
"取消粘贴缩进
nmap <leader>p :set paste<CR>
nmap <leader>pp :set nopaste<CR>
"插入模式下移动
inoremap <c-e> <right>
inoremap <c-w> <left>
"去掉左右两边的滚动条
set go-=r
set go-=L

"快捷键
nnoremap nw <C-W><C-W>



" set mapleader
let mapleader=','



" python 的配置
autocmd FileType python set omnifunc=pythoncomplete#Complete   




"自动添加文件头
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- coding:utf-8 -*-")
    call append(2, "#Author : GaoJiasheng")
    call append(3, "#" . strftime('%Y-%m-%d %T', localtime()))
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()



" UltiSnips 的 tab 键与 YCM 冲突，重新设定
 let g:UltiSnipsSnippetDirectories=['UltiSnips']
 let g:UltiSnipsSnippetsDir = '~/.vim/bundle/vim-snippets/UltiSnips'
 let g:UltiSnipsExpandTrigger="<leader><tab>"
 let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
 let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>""

 " easy motion 配置
 "map <Leader>ef <Plug>(easymotion-lineforward)
 "map <Leader>eb <Plug>(easymotion-linebackward)
 "map <Leader><Leader>d <Plug>(easymotion-j)
 "map <Leader><Leader>t <Plug>(easymotion-k)
 "map  / <Plug>(easymotion-sn)
 "omap / <Plug>(easymotion-tn)
 "map  n <Plug>(easymotion-next)
 "map  N <Plug>(easymotion-prev)
 "let g:EasyMotion_smartcase = 1
 "let g:EasyMotion_startofline = 0 " keep cursor column when JK motion"
syntax on

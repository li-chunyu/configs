call plug#begin('~/.vim/plugged') 
"文件浏览树
Plug 'preservim/nerdtree'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rakr/vim-one'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dense-analysis/ale'

"base16主题
Plug 'chriskempson/base16-vim'

"补全
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp' 
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-go'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

"状态栏
Plug 'vim-airline/vim-airline'

call plug#end()

"缓存
autocmd BufEnter * call ncm2#enable_for_buffer()
" 补全模式,具体详情请看下文
set completeopt=menu,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
" 延迟弹窗,这样提示更加流畅
let ncm2#popup_delay = 5
"输入几个字母开始提醒:[[最小优先级,最小长度]]
"如果是输入的是[[1,3],[7,2]],那么优先级在1-6之间,会在输入3个字符弹出,如果大于等于7,则2个字符弹出----优先级概念请参考文档中 ncm2-priority 
let ncm2#complete_length = [[1, 1]]
"模糊匹配模式,详情请输入:help ncm2查看相关文档
let g:ncm2#matcher = 'substrfuzzy'
"使用tab键向下选择弹框菜单
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>" 
"使用shift+tab键向上选择弹窗菜单,这里不设置因为笔记本比较难操作.如果向下太多我通常习惯使用Backspace键再重新操作一遍
"inoremap <expr> <S> pumvisible() ? "\<C-p>" : "\<S>"


"languageClient-neovim 配置
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" pyclang C++ 不全
let g:ncm2_pyclang#library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
" python 补全
let g:ncm2_jedi#python_version = 3
let g:python3_host_prog = '/usr/local/bin/python3'

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
set nu
set ts=4

"==================================
" colors"
"==================================
syntax on
syntax enable
"set termguicolors
"
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif
set termguicolors
let base16colorspace=256
set background=dark
colorscheme base16-gruvbox-dark-hard
hi Normal ctermbg=NONE

"===================================
" GUI Setting
"===================================
set mouse=a
" 高亮第80列
set colorcolumn=80

"===================================
" Editor setting
"===================================
filetype plugin indent on
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces


" search
set incsearch
set ignorecase
set smartcase

" tab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab


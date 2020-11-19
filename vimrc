" Yuliang's .vimrc
"
" 配色方案(可用 :highlight 查看配色方案细节)
" colorscheme blue
" colorscheme darkblue
" colorscheme delek
" colorscheme desert
" colorscheme elflord
" colorscheme evening
" colorscheme koehler
" colorscheme morning
" colorscheme murphy
" colorscheme pablo
" colorscheme peachpuff
" colorscheme ron
" colorscheme shine
" colorscheme slate
" colorscheme torte
" colorscheme zellner

" 打开语法高亮
syntax on

" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 为不同文件类型使用不同缩进
filetype indent on

" 显示行号
set number " relativenumber
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" 列限宽及限宽线颜色
set colorcolumn=80
highlight ColorColumn ctermbg=5

" 打开拼写检查
" set spell

" 为 C 程序提供自动缩进
set smartindent

" 打开自动缩进
set autoindent

" 使用 C/C++ 的缩进方式
set cindent

" 设置插入模式下粘贴文本时不缩进
set paste

" 设置自动缩进长度为四个空格
set shiftwidth=4

" 按退格键时可以一次删掉 4 个空格
set softtabstop=4

" 设定 tab 键长度为 4
set tabstop=4

" 将 tab 展开为空格
set expandtab

" 去掉输入错误时的提示声音
set noerrorbells

" 右下角显示光标位置
set ruler

" 总是显示状态行
set laststatus=2

" 自定义状态行
set statusline=%f%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    +-- 当前列数
"              | | | | |  |   |      |  |     +-- 当前行数
"              | | | | |  |   |      |  +-- 当前光标位置百分比
"              | | | | |  |   |      +-- 使用的语法高亮器
"              | | | | |  |   +-- 文件格式
"              | | | | |  +-- 文件总行数
"              | | | | +-- 预览标志
"              | | | +-- 帮助文件标志
"              | | +-- 只读标志
"              | +-- 已修改标志
"              +-- 当前文件名或路径

" 强调匹配的括号
set showmatch

" 光标短暂跳转到匹配括号的时间, 单位是十分之一秒
set matchtime=2

" 显示当前正在键入的命令
set showcmd

" 设置自动切换目录为当前文件所在目录，用 :sh 时候会很方便
set autochdir

" 搜索时忽略大小写
set ignorecase

" 随着键入即时搜索
set incsearch

" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 代码折叠
set foldenable

" XML 代码折叠 See: /usr/share/vim/vim73/syntax/xml.vim
let g:xml_syntax_folding=1

" 折叠方法
" manual	手工折叠
" indent	使用缩进表示折叠
" expr		使用表达式定义折叠
" syntax	使用语法定义折叠
" diff		对没有更改的文本进行折叠
" marker	使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent

if has("autocmd")
"   autocmd BufNewFile,BufRead *.mi set filetype=xml
"   Search gmail to Rachel Zhang for details
    autocmd FileType bib  setlocal foldmethod=syntax
    autocmd FileType c    setlocal foldmethod=syntax
    autocmd FileType cpp  setlocal foldmethod=syntax
    autocmd FileType java setlocal foldmethod=syntax
    autocmd FileType xml  setlocal foldmethod=syntax
endif

" 在左侧显示折叠的层次
" set foldcolumn=4

" 加入一些常见的中文编码
set fileencodings=utf8,cp936,gb18030,big5

" 不退出 vim 临时计算数据
py from math import *
com! -nargs=+ Cal :py print <args>

" =======
"
" 退出编辑模式时自动保存，条件为文件存在且可写，文件名非空
if has("autocmd") && filewritable(bufname("%"))
    autocmd InsertLeave ?* write
endif

" 针对 Python 文件的设定
if has("autocmd")
    autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
endif

" For Pig files
augroup filetypedetect
    au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END

" Pathogen
execute pathogen#infect()


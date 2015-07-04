"============================================================
"============================================================
"    FileName:  .vimrc
"    Author: 	LD00000   
"    Version:	1.0   
"    Email: 	lidong9144@163.com     
"============================================================
"============================================================


"==============================================================
""==============================================================
"
"" Vundle插件管理和配置项
"
""==============================================================
"==============================================================
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"设置vim路径并初始化
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"或者，设置Vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"以下为官方引入插件方法示例
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

"=====================================================
" 具体用法查询插件文档
"=====================================================

" Fugitive: Git 集成
Plugin 'tpope/vim-fugitive'

" Solarized - precision colorscheme for the vim text editor
" 配色
Plugin 'altercation/vim-colors-solarized'

syntax enable	"开启语法高亮
set background=dark
"set background=light
set t_Co=256	"指定配色方案为256色
let g:solarized_termcolors=256
colorscheme solarized
"if has('gui_running')
"    set background=light
"else
"    set background=dark
"endif

" Commentary - Comment stuff out
" 快速注释
Plugin 'tpope/vim-commentary'

" YouCompleteMe - A code-completion engine for Vim
" 代码自动补全
Plugin 'Valloric/YouCompleteMe'

"nerdtree - A tree explorer plugin for vim.
"树形浏览
Plugin 'scrooloose/nerdtree'

let NERDChristmasTree=0
let NERDTreeWinSize=25
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F6> :NERDTreeToggle<cr>

"Vim plugin that displays tags in a window
"浏览文件结构
Plugin 'majutsushi/tagbar'

let g:tagbar_width=25
let g:tagbar_autofocus=1
nmap <F7> :TagbarToggle<CR>

"ctrlp.vim - Fuzzy file, buffer, mru, tag, etc finder
"搜索
Plugin 'kien/ctrlp.vim'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
nmap <F8> :CtrlpToggle<CR>

"Powerline - a statusline plugin for vim
"下方状态条
"Plugin 'powerline/powerline'

"set laststatus=2 "Always display the status line
"set statusline+=%{fugitive#statusline()} "Git Hotness

"airline - lean & mean status/tabline for vim that's light as air 
"下方状态条
Plugin 'bling/vim-airline'

"Syntastic - Syntax checking hacks for vim 
"语法检查
Plugin 'scrooloose/syntastic'

let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*




" Airline: 小巧美观的状态栏。
"Plugin 'bling/vim-airline'

" MATLAB/MATLAB-fold: MATLAB 语法高亮及代码折叠插件。
"Plugin 'djoshea/vim-matlab'
"Plugin 'djoshea/vim-matlab-fold'

" Tabular: 自动对齐。
"Plugin 'godlygeek/tabular'



" All of your Plugins must be added before the following line
"所有插件必须在这行之前添加
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
"		    - 列出配置的插件	
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"		    - 安装插件;添加'!'来更新或者输入 :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"		    - 查找插件；添加'!'来刷新当地缓存
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"		    - 删除列表中没有的插件；添加'!'删除时自动确认
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"=============================================================
"=============================================================
"
"    Vim基本配置
"
"=============================================================
"=============================================================

"配置backspace键工作方式
"set backspace=indent,eol,start


"显示行号
set number
"设置在编辑过程中右下角显示光标的行列信息
set ruler
"当一行文字很长时取消换行
"set nowrap

"在状态栏显示正在输入的命令
set showcmd

"设置历史记录条数
set history=1000

"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile

"突出现实当前行列、高亮当前行列
"配置主题后再开启该这两个功能(比如solarized) 否则会很难看
" Highlight current line
set cursorline
set cursorcolumn

"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"设置C/C++方式自动对齐
set autoindent
set cindent

"设置搜索时忽略大小写
set ignorecase

"设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
set mouse=a

"设置Tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4
"设置按退格键时可以一次删除4个空格
set softtabstop=4
"设置按退格键时可以一次删除4个空格
set smarttab
"将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
"set expandtab

"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1



"检测文件类型
"filetype on
"针对不同的文件采用不同的缩进方式
"filetype indent on
"允许插件
"filetype plugin on
"启动智能补全
"filetype plugin indent on

"===================================================================
"===================================================================
"
"   自定义vim操作
"
"====================================================================
"====================================================================
map <F5> :call Do_OneFileMake()<CR>
map <F2> :call Do_FileSave()<CR>
map <F3> :call Do_FileSaveAndQuit()<CR>

" === 当前文件保存 ===
function Do_FileSave()
    let source_file_name=expand("%:t")
    if source_file_name==""
        echoh1 WarningMsg | echo "The file name is empty." | echoh1 None
        return
    endif

    execute "w"
endfunction

" === 当前文件保存退出 ===
function Do_FileSaveAndQuit()
    let source_file_name=expand("%:t")
    if source_file_name==""
        echoh1 WarningMsg | echo "The file name is empty." | echoh1 None
        return
    endif

    execute "wq"
endfunction



" === 单文件编译 仅支持c、cc、cpp、go文件 ===
function Do_OneFileMake()
    if expand("%:p:h")!=getcwd()
        echoh1 WarningMsg | echo "Failed to make. This's file is not in the current dir." | echoh1 None
        return
    endif

    let source_file_name=expand("%:t")

    if source_file_name==""
        echoh1 WarningMsg | echo "The file name is empty." | echoh1 None
        return
    endif

    if ( (&filetype!="c")&&(&filetype!="cc")&&(&filetype!="cpp")&&(&filetype!="go") )
    echoh1 WarningMsg | echo "Please just make c、cc、cpp and go file." | echoh1 None
        return
    endif

    if &filetype=="c"
        set makeprg=gcc\ %\ -o\ %<
    endif

    execute "w"
    execute "silent make"
    execute "q"
endfunction



" 窗口相关快捷键
noremap <c-h> <C-w>h
noremap <c-j> <C-w>j
noremap <c-k> <C-w>k
noremap <c-l> <C-w>l
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
if !common#functions#HasPlug('ResizeWindow.vim')
    " 更改窗口垂直大小
    nnoremap <M--> :resize +3<CR>
    nnoremap <M-_> :resize -3<CR>
    " 更改窗口水平大小
    nnoremap <M-(> :vertical resize -3<CR>
    nnoremap <M-)> :vertical resize +3<CR>
endif
" 分割窗口
"在vim下分屏
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

map <C-f> :/

nnoremap <SPACE> <Nop>

let mapleader="\<SPACE>"

map <leader>s :w!<CR>
map <leader>q :q!<CR>
" 关闭窗口
nnoremap <silent> q <esc>:close<cr>
vnoremap <silent> q <esc>:close<cr


" 使用回车打开关闭折叠
nnoremap <CR> za
" shift enter，为何不可以？
nnoremap <S-Return> zMzo
" 关闭搜索颜色
nnoremap <BackSpace> :nohl<cr>

" 命令行移动
cnoremap <C-h> <Home>
cnoremap <C-l> <End>
" cnoremap <C-l> <Right>
" cnoremap <C-j> <Left>

" 使用alt q关闭当前buffer
nnoremap <M-q> <esc>:bdelete<cr>

" 去除EX模式
nmap Q <nop>
" 使用Q进行宏录制
noremap Q q

nnoremap <SPACE> <Nop>

let mapleader="\<SPACE>"

map <leader>s :w!<CR>
map <leader>q :q!<CR>
map <leader>sq :wq!<CR>

nmap << <<_
nmap >> >>_

nnoremap ! :!

" 跳转到最后
" 0是跳转到开头
nnoremap 9 $

augroup vime_keymap_group
    autocmd!
    " 使用esc退出终端
    if has('nvim')
        au TermOpen term://* tnoremap <buffer> <Esc> <c-\><c-n> " | startinsert
        " au BufEnter term://* startinsert
    else
        au TerminalOpen term://* tnoremap <buffer> <Esc> <C-\><C-n> " | startinsert
        " au BufEnter term://* startinsert
    endif
augroup END

" 新建终端
nnoremap <leader>tt :terminal<cr>

" 插入模式下的一些快捷键
inoremap <M-o> <esc>o
inoremap <M-O> <esc>O
" inoremap <M-h> <HOME>
inoremap <M-h> <esc>^i
inoremap <M-l> <END>
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

function! s:writeCurrent() abort
    if !&readonly && &buftype =~# '^\%(acwrite\)\=$' && expand('%') !=# ''
        silent write
    endif
endfunction
" noremap <silent> <space><space> <esc>:call common#functions#Wall()<cr>
" noremap <silent> <space><space> <esc>:call <SID>writeCurrent()<cr>
" xnoremap <silent> <space><space> <esc>:call <SID>writeCurrent()<cr>
noremap <silent> <space><space> <esc>:silent! write<cr>
xnoremap <silent> <space><space> <esc>:silent! write<cr>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 复制到末尾
nnoremap Y y$
nnoremap vv ^vg_

if !common#functions#HasPlug('vim-airline') && !common#functions#HasPlug('vim-crystalline')
    nnoremap  <M-l> :call common#functions#MoveTabOrBuf(1)<cr>
    nnoremap  <M-h> :call common#functions#MoveTabOrBuf(0)<CR>
    tnoremap  <M-l> <c-\><c-n>:call common#functions#MoveTabOrBuf(1)<cr>
    tnoremap  <M-h> <c-\><c-n>:call common#functions#MoveTabOrBuf(0)<CR>
endif
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <M-L> :tabmove +1<cr>
nnoremap <silent> <M-H> :tabmove -1<cr>
tnoremap <silent> <M-L> <c-\><c-n>:tabmove +1<cr>
tnoremap <silent> <M-H> <c-\><c-n>:tabmove -1<cr>

" 使用系统应用打开当前buffer文件
noremap <silent> <M-x> :call common#functions#OpenFileUsingSystemApp(expand('%:p'))<cr>

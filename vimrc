call pathogen#infect() " call pathogen from ~/.vim/bundle

" syntax highlighting
syntax on
filetype plugin indent on

"turn on omnicomplete
set ofu=syntaxcomplete#Complete

" delimitMate -----------------------------------------
let delimitMate_expand_cr=1 " Expand carriage return
let delimitMate_expand_space=1 " Expand spaces

" don't map <CR> as it's causing conflicts with delimitMate's; expand CR
let g:SuperTabCrMapping = 0
let g:SuperTabMappingForward = '<Tab>'
let g:SuperTabMappingBackward = '<S-Tab>'
let g:SuperTabDefaultCompletionType = "<c-n>"

" set syntax highlight for cisco acl files 
augroup filetype
        au! BufRead,BufNewFile *.crules set filetype=ciscoacl
        au! BufRead,BufNewFile *.acl    set filetype=ciscoacl
augroup END 

" Ommnicppcomplete configuration
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
" configure tags - add additional tags here or comment out not-used ones
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

""""""""""""delimitMate"""""""""""""""""""""""""""""""
" For delimitMate 0 indicates false and 1 indicates true
" turn space expansion off in delimitMate 
let delimitMate_expand_space = 0
au FileType tcl let b:delimitMate_expand_space = 1

" turn on smart quotes in delimitMate
let delimitMate_smart_quotes = 1
au FileType tcl let b:delimitMate_smart_quotes = 1

" Turn off delimitMate for certain filetypes
au FileType html let b:loaded_delimitMate = 1

"""""""""""""""""""NERDTree"""""""""""""""""""""""""
" NERDTree window size 
let NERDTreeWinSize = 75

"Vim latex plugin """""""""""""""""""""""""""""""""
let g:tex_indent_items = 1

" Do not automatically reload vim script with vim-reload plugin
let g:reload_on_write = 0

" Setup javacomplete with autocmd
if has("autocmd")
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
  autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
endif 

" Vim color scheme settings 
" gentooish.vim inkpot.vim ir_black.vim jellybeans.vim lucius.vim  
" oceandeep.vim peaksea.vim proton.vim solarized.vim
" darkblue.vim delek.vim elflord.vim koehler.vim murphy.vim peachpuff.vim
" shine.vim torte.vim blue.vim default.vim desert.vim evening.vim  
" morning.vim pablo.vim ron.vim slate.vim zellner.vim  
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_visibility="normal"
let g:solarized_contrast="high"
colorscheme solarized

" Set no errorbells in vim
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" This makes vim buffer read latex right away and have syntax enabled 
au BufRead,BufNewFile *.tex set ft=tex
au BufRead,BufNewFile *.txt set syntax=hybrid 
au BufRead,BufNewFile *.sql set filetype=mysql
au BufRead,BufNewFile *.test set filetype=mysql
" set html to cindent
" au BufEnter *.html,*.php set indentexpr=|set cindent

" misc settings
set equalalways "this option always resizes windows equally
set history=400
set autoread
set tw=72
set so=7
set nocompatible
set wildmenu
set ruler
set tabstop=2
set shiftwidth=2
set noexpandtab
set softtabstop=2
set cmdheight=2
set hid
set backspace=eol,start,indent
set shiftround
set ignorecase
set smartindent
set nobackup
set nowb
set noswapfile
set viminfo='20,\"50
set number
set linebreak
set wildmode=longest,list,full
set wildmenu
set noerrorbells
set incsearch
set hlsearch
set shell=/usr/local/bin/zsh

" disable autocomment to another line in these languages
au FileType c,cpp,java,javascript,php,css,vim,bash,zsh,sh setlocal comments-=:// comments+=f://

" The following line in ~/.vimrc will suppress the insertion of file header 
" comments. This hack is for cvim vim bundle C/C++ IDE
" This is a hack because switching between styles automatically no longer works
" This issue will be resolved in the next release.
" let g:C_Styles = {}
" solarized.vim colorscheme settings for MacVim
"  let g:solarized_visibility="high"
"  let g:solarized_contrast="high"
"  colorscheme solarized
" MacVim settings
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
  syntax on
  set tabstop=2
  set shiftwidth=2
  set noexpandtab
  set softtabstop=2
  set cmdheight=2
  set background=dark
  set guifont=Menlo:h16
  let g:solarized_visibility="high"
  let g:solarized_contrast="high"
  colorscheme solarized
  highlight SpellBad term=underline gui=undercurl guisp=Orange 
  set incsearch
  set hlsearch
  set ruler
  set tabstop=2
  set guifont=Menlo:h16
  set noerrorbells
endif

" Vim Key Bindings
" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
let mapleader = ","
" Map escape character to jj 
imap jj <Esc>
" Mapping makes ,w open a new vertical split and switch over to it.
nnoremap <leader>w <C-w>v<C-w>l
" Map ,; to open command-line history
nnoremap <leader>; q: 
" Map ,g to go to other vertical split 
nnoremap <leader>e <C-w><C-w>
" Map ,q closes the current window
nnoremap <leader>q <C-w>q
" Map ,v to be control v 
nnoremap <leader>v <C-v>
" Single compile feature to compile in various languages
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

" Command T plugin key mappings
" default map is nnoremap <leader>t  :CommandT<CR>
noremap <leader>tb :CommandTBuffer<CR>

" Map scrolling keys in vim
nnoremap <leader>f <C-f> " map control forward
nnoremap <leader>b <C-b> " map control back
nnoremap <leader>d <C-d> " map conrol down half screen
nnoremap <leader>u <C-u> " map control up half screen

" show vim information 
nnoremap <leader>g <C-g> " show vim information such as lines, etc.
nnoremap <leader>l <C-l> " redraw the vim screen
map <leader>h :ListMethods " ListMethods keybinding
map <leader>y :exec("CocoaDoc ".expand("<cword>"))<CR>
nnoremap <leader>r <C-R> " map Control-R which is Redo

" Tab movement keys
nnoremap gf  :tabfirst<CR>
nnoremap gl  :tabnext<CR>
nnoremap gh  :tabprev<CR>
nnoremap gL  :tablast<CR>
nnoremap gt  :tabedit<Space>
nnoremap gn  :tabnext<Space>
nnoremap gd  :tabclose<CR>

" Move tabs left or right
noremap gk :call TabMove(+1)<CR>
noremap gj :call TabMove(-1)<CR>

" set paste leader keys
nnoremap <leader>p :set paste<CR>
nnoremap <leader>np :set nopaste<CR>

" if there is more than one window open in vim then + and - increase and
" decrease window size respectively
if bufwinnr(1)
	map + <C-W>+
	map - <C-W>-
endif

" Move current tab into the specified direction.
" @param direction -1 for left, 1 for right.
function! TabMove(direction)
    " get number of tab pages.
    let ntp=tabpagenr("$")
    " move tab, if necessary.
    if ntp > 1
        " get number of current tab page.
        let ctpn=tabpagenr()
        " move left.
        if a:direction < 0
            let index=((ctpn-1+ntp-1)%ntp)
        else
            let index=(ctpn%ntp)
        endif

        " move tab page.
        execute "tabmove ".index
    endif
endfunction

" Map for better display
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P> 

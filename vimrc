"""""""""""""""""""Pathogen"""""""""""""""""""""""""""""""
call pathogen#infect() " call pathogen from ~/.vim/bundle
"""""""""""""""""""Pathogen""""""""""""""""""""""""""""""

"""""""""""""""" autocomplete plugin """"""""""""""""""
let g:acp_enableAtStartup = 0 "since zero it is disabled by default
let g:acp_behaviorRubyOmniMethodLength = -1 "if negative never completed
let g:acp_behaviorRubyOmniSymbolLength = -1 "if negative never completed
let g:acp_behaviorPythonOmniLength = -1 "if negative never completed
let g:acp_behaviorPerlOmniLength = -1 "if negative never completed
let g:acp_behaviorXmlOmniLength = -1 "if negative never completed
let g:acp_behaviorHtmlOmniLength = -1 "if negative never completed
"""""""""""""""" autocomplete plugin """"""""""""""""""

""""""""""""""""""""" syntax highlighting """"""""""""""""
filetype plugin indent on
syntax on
""""""""""""""""""""" syntax highlighting """"""""""""""""

""""""""""""""""""""" vim powerline plugin """""""""""""""""""
let g:Powerline_symbols = 'fancy'
""""""""""""""""""""" vim powerline plugin """""""""""""""""""

"""""""""""""""""""""gundo plugin """"""""""""""""
let g:gundo_width = 75
""""""""""""""""""""" gundo plugin """"""""""""""""

""""""""""""""""""""" yankring plugin """""""""""""""""""""""""
let g:yankring_history_dir = '~/.vim/yankring'
let g:yankring_history_file = 'yankring_history'

"""""""""""""""""""supertab"""""""""""""""""""""""""""""""""""""
" don't map <cr> as it's causing conflicts with delimitmate's; expand cr
let g:SuperTabCrMapping = 0
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'
let g:SuperTabDefaultCompletionType = "<c-n>" 
"""""""""""""""""""supertab"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""" omnicppcomplete """""""""""""""""""""
let omnicpp_namespacesearch = 1
let omnicpp_globalscopesearch = 1
let omnicpp_showaccess = 1
let omnicpp_showprototypeinabbr = 1 " show function parameters
let omnicpp_maycompletedot = 1 " autocomplete after .
let omnicpp_maycompletearrow = 1 " autocomplete after ->
let omnicpp_maycompletescope = 1 " autocomplete after ::
let omnicpp_defaultnamespaces = ["std", "_glibcxx_std"]
au bufnewfile,bufread,bufenter *.cpp,*.hpp set omnifunc=omni#cpp#complete#main
set ofu=syntaxcomplete#complete
"""""""""""""""""""""" omnicppcomplete """""""""""""""""""""

""""""""""""""""""delimitmate"""""""""""""""""""""""""""""""
" for delimitmate 0 indicates false and 1 indicates true
" turn space expansion off in delimitmate 
let delimitMate_expand_space = 0
" turn on smart quotes in delimitmate
let delimitMate_smart_quotes = 1
" turn on delimitmate carriage return expansion
let delimitMate_expand_cr = 1
" turns on delimitmate jumping over expansion
let delimitMate_jump_expansion = 1
" turn off delimitmate for certain filetypes
au filetype html,php let b:loaded_delimitMate = 1
""""""""""""delimitmate"""""""""""""""""""""""""""""""

"""""""""""""""""""nerdtree"""""""""""""""""""""""""
" nerdtree window size 
let nerdtreewinsize = 75
"""""""""""""""""""nerdtree"""""""""""""""""""""""""

"""""""""""""vim-latex plugin """"""""""""""""""""""""""
let g:tex_indent_items = 1
"""""""""""""vim-latex plugin """"""""""""""""""""""""""

"""""""""""""javacomplete"""""""""""""""""""""""
""""""""""""""" setup javacomplete with autocmd
if has("autocmd")
  autocmd filetype java setlocal omnifunc=javacomplete#complete
  autocmd filetype java setlocal completefunc=javacomplete#completeparamsinfo
endif 
"""""""""""""javacomplete"""""""""""""""""""""""

""""""""""""""""""colorscheme"""""""""""""""""""""""
" colorscheme settings for solarized
set t_co=256
set background=dark
set guifont=menlo\ regular\ for\ powerline:h15
colorscheme solarized
""""""""""""""""""colorscheme"""""""""""""""""""""""

""""""""""""""""""""""" error bells """"""""""""""""""
" set no errorbells in vim and macvim
set noerrorbells visualbell t_vb=
autocmd guienter * set visualbell t_vb=
""""""""""""""""""""""" error bells """"""""""""""""""

"""""""""""""""""" read files in automatically in buffer """""""""""
" This makes vim buffer read latex right away and have syntax enabled 
au BufRead,BufNewFile *.tex set ft=tex
au BufRead,BufNewFile *.sql set filetype=mysql
au BufRead,BufNewFile *.test set filetype=mysql
au BufRead,BufNewFile *.jnlp set ft=xml
au BufNewFile,BufRead *vimperatorrc*,*.vimp set filetype=vimperator
au BufNewFile,BufRead *muttatorrc*,*.muttator set filetype=muttator
"""""""""""""""""" Read files in automatically in buffer """""""""""

" disable autocomment to another line in these languages
au FileType c,cpp,java,perl,javascript,php,css,vim,bash,zsh,sh setlocal comments-=:// comments+=f://

"""""""""""""""""" set options in vim """""""""""""""""""""""
set equalalways "this option always resizes windows equally
set history=200
set autoread
set tw=82
set nocompatible
set laststatus=2
set encoding=utf-8
set wildmenu
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set cmdheight=1
set hid
set backspace=eol,start,indent
set shiftround
set ignorecase
set nobackup
set autoindent 
set smartindent
set nowb
set magic " for regular expression turn magic on
set showmatch " show matching delimiters
set noswapfile
set viminfo='20,\"50
"set makeprg=gcc-4.9\ -Wall\ -W\ -o\ $* 
set number
set wildmode=longest:full,full
set wildmenu
set noerrorbells
set incsearch
set hlsearch
"""""""""""""""""" set options in vim """""""""""""""""""""""

"""""""""""""""""""" MacVim settings """"""""""""""""""""""""
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
  syntax on
  set equalalways "this option always resizes windows equally
  set history=200
  set autoread
  set tw=82
  set nocompatible
  set laststatus=2
  set encoding=utf-8
  set wildmenu
  set ruler
  set tabstop=4
  set shiftwidth=4
  set expandtab
  set softtabstop=4
  set cmdheight=1
  set hid
  set backspace=eol,start,indent
  set shiftround
  set ignorecase
  set nobackup
  set autoindent 
  set smartindent
  set nowb
  set magic " for regular expression turn magic on
  set showmatch " show matching delimiters
  set noswapfile
  set viminfo='20,\"50
  set number
  set wildmode=longest:full,full
  set wildmenu
  set noerrorbells
  set incsearch
  set hlsearch
  set background=dark
  set guifont=Menlo\ Regular\ for\ Powerline:h15
  let g:solarized_visibility="high"
  let g:solarized_contrast="high"
  colorscheme solarized
endif
"""""""""""""""""""" MacVim settings """"""""""""""""""""""""

"""""""""""""""""" Vim Key Bindings """"""""""""""""""""""""""
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

"""" Visual Mode Copy and Cut Commands to Mac ClipBoard """""
vmap <C-x> :!pbcopy<CR>  
vmap <C-c> :w !pbcopy<CR><CR> 

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

" map control key sequence to run aspell in vim
map <leader>a :w!<CR>:!aspell check %<CR>:e! %<CR>

" Tab movement keys
nnoremap gf  :tabfirst<CR>
nnoremap gL  :tablast<CR>
nnoremap gt  :tabedit<Space>
nnoremap gn  :tabnext<Space>
nnoremap gd  :tabclose<CR>
nnoremap gl :tabnext<CR>
nnoremap gh :tabprev<CR>

" Move tabs left or right
noremap gk :call TabMove(+1)<CR>
noremap gj :call TabMove(-1)<CR>

" set paste leader keys
nnoremap <leader>p :set paste<CR>
nnoremap <leader>np :set nopaste<CR>

" gundo key binding"
nnoremap <F6> :GundoToggle<CR>
" if there is more than one window open in vim then + and - increase and
" decrease window size respectively
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Map for better display
" inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
" inoremap <buffer> <C-S-Space> <C-X><C-U><C-P> 
"""""""""""""""""" Vim Key Bindings """"""""""""""""""""""""""

"""""""""""""""""""""""""""""" Functions """""""""""""""""""
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

"" function that checks file types within first 200 characters
augroup newFileDetection
  autocmd CursorMovedI * call ChecksFileType()
augroup END

if !exists("*ChecksFileType")
  function ChecksFileType()

    if exists("b:countCheck") == 0
      let b:countCheck = 0
    endif

    let b:countCheck += 1
    " Don't start detecting until approximately 20 characters
    if &filetype == "" && b:countCheck > 20 && b:countCheck < 200
      filetype detect
      " if we've exceeded the count threshold (200), OR  a filetype
      " has been detected
    elseif b:countCheck >= 200 || &filetype != ""
    endif
  endfunction
endif
"""""""""""""""""""""""""""""" Functions """""""""""""""""""

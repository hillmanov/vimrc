" -----------------------------------------------------
" Important
" -----------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required for Vundle

" -----------------------------------------------------
" Plugins
" -----------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'Raimondi/delimitMate'
Plug 'marijnh/tern_for_vim'
Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'digitaltoad/vim-jade'
Plug 'fatih/vim-go'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'tpope/vim-commentary'
Plug 'groenewege/vim-less'
Plug 'gregsexton/MatchTag'
Plug 'tmhedberg/matchit'
Plug 'rking/ag.vim'
Plug 'dbakker/vim-projectroot'
Plug 'tpope/vim-abolish'
Plug 'kshenoy/vim-signature' " Adds label in gutter for marks 
Plug 'sjl/vitality.vim' " Adds a nicer cursor when in insert mode
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/syntastic'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
" Plug 'terryma/vim-multiple-cursors'

call plug#end()            " required

" -----------------------------------------------------
" Moving around, searching and patterns
" ------------------------------------------------------
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present

set iskeyword-=.                " '.' is an end of word designator
set iskeyword-=#                " '#' is an end of word designator
set iskeyword-=-                " '-' is an end of word designator

set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

" -----------------------------------------------------
" Displaying text
" -----------------------------------------------------
set guifont=Meslo\ LG\ M\ for\ Powerline:h14
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set relativenumber              " Relative line numbers

set scrolljump=1                " Lines to scroll when cursor leaves screen
set scrolloff=8                 " Minimum lines to keep above and below cursor
" set list                        " Show white space characters
" set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set nowrap                      " Don't wrap long lines Don't

" -----------------------------------------------------
" Syntax, highlighting and spelling
" -----------------------------------------------------
syntax on
syntax sync minlines=256
colorscheme gruvbox
set background=dark
set nospell                     " Spell checking on

" -----------------------------------------------------
" Multiple windows
" -----------------------------------------------------
set hidden                      " Allow buffer switching without saving
set splitright                  " A new window is put right of the current one
set splitbelow                  " A new window is put below of the current one
set laststatus=2                " Always show the status bar / Airline

" -----------------------------------------------------
" Using the mouse
" -----------------------------------------------------
set mouse=a "Enabled mouse for highlighting text
set mousehide "Hide mouse while characters are being typed

" -----------------------------------------------------
" Selecting text
" -----------------------------------------------------

" -----------------------------------------------------
" Editing text
" -----------------------------------------------------
set showmatch                   " Show matching brackets/parenthesis
autocmd FileType java,go,javascript,python,html,less,css,json autocmd BufWritePre <buffer> call StripTrailingWhitespace() 
" -----------------------------------------------------
" Tabs and indenting
" -----------------------------------------------------
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set smartindent " Intellegently dedent / indent new lines based on rules."

" -----------------------------------------------------
" Folding
" -----------------------------------------------------
set foldenable                  " Auto fold code

" -----------------------------------------------------
" Diff mode
" ----------------------------------------------------

" -----------------------------------------------------
" Mapping
" -----------------------------------------------------
set timeoutlen=250

" -----------------------------------------------------
" The swap file
" -----------------------------------------------------
set noswapfile " Turn off swp file creation

" -----------------------------------------------------
" Command line editing
" -----------------------------------------------------
set history=1000                " Store a ton of history (default is 20)
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

" -----------------------------------------------------
" Various
" -----------------------------------------------------
scriptencoding utf-8
set clipboard=unnamed

set undofile                                            " save central undo files
set undodir=~/.vim/tmp/undo/
set backup                                              " enable backups
set backupdir=~/.vim/tmp/backup/
set virtualedit=onemore                                 " Allow for cursor beyond last character
set nojoinspaces                                        " Don't add more spaces with joing lines with <S-J>
set shortmess=I                                         " Don't show the intro message on startup
" -----------------------------------------------------
" Key (re)mappings 
" -----------------------------------------------------

" Set space to <Leader>"
let mapleader = ' '
imap jk <Esc>
vmap jk <Esc>

noremap j gj
noremap k gk

" Make Y act like D and C
noremap Y y$

" Go to the end of what was just pasted. 
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
noremap <Leader>x :bd<CR>
noremap <Leader>X :BufOnly<CR>

" Replace current word with what is in the clipboard
nnoremap <Leader>s "_diwP

" Move lines around with Alt j and k in any mode
nnoremap <Down> :m .+1<CR>==
nnoremap <Up> :m .-2<CR>==

inoremap <Down> <Esc>:m .+1<CR>==gi
inoremap <Up> <Esc>:m .-2<CR>==gi

vnoremap <Down> :m '>+1<CR>gv=gv
vnoremap <Up> :m '<-2<CR>gv=gv

" Formated pasted text automatically
nnoremap p ]p

" Select pasted text
nnoremap gp `[v`]

" Adjust viewports to the same size
map <Leader>= <C-w>=

cmap w!! w !sudo tee > /dev/null %

nnoremap <Leader>w :w<cr>
nnoremap <Leader><Leader>n :!node %<cr>

" Search and replace in the file
nnoremap <Leader>h :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
vnoremap <Leader>h "hy:%s/<C-r>h//gc<left><left><left>

" Search and replace in the files in the quickfix list
nnoremap <Leader>H :Qargs \| argdo %s/\<<C-r><C-w>\>//gc \| update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
vnoremap <Leader>H "hy:Qargs \| argdo %s/<C-r>h//gc \| update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Find project wide
nnoremap <Leader><Leader>/ :ProjectRootExe Ag<space><C-r><C-w><space>-Q<space>-w
vnoremap <Leader><Leader>/ "hy:ProjectRootExe Ag<space><C-r>h<space>

" vimrc edit and source
nnoremap <Leader>ev :tabe $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>

let g:indent_guides_enable_on_vim_startup = 0

" Quick fix file navigation
nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

tnoremap jk <c-\><c-n>
" -----------------------------------------------------
" PLugin settings
" -----------------------------------------------------
" NERFTree customizations
map <C-n> :NERDTreeToggle<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\~$', '\.swp$', '^\.git$','^node_modules$', '^\.DS_Store$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" CtrlP customizations
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = { 'dir':  '\.git$' }
let s:ctrlp_fallback = 'ag %s --nocolor -f'
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
      \ },
      \ 'fallback': s:ctrlp_fallback
      \ }
let g:ctrlp_match_window_bottom   = 0
let g:ctrlp_match_window_reversed = 0

"Fugitive customizations
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>

" Start ieteractive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" EasyMotion
nmap <Leader><Leader>s <Plug>(easymotion-s)

" change the default EasyMotion shading to something more readable with Solarized
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" Settings for gitgutter to look right with solarized theme
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2* guifg=darkgreen " Had to use the 2* to get it to turn green
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" Expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Javascript library syntax highlighting settings
let g:used_javascript_libs = 'underscore,jquery,angularjs,chai'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Use goimports
let g:go_fmt_command = "goimports"
" -----------------------------------------------------
" Helper functions
" -----------------------------------------------------
" Strip whitespace
function! StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" -----------------------------------------------------
" Qargs - used for populating the args list with the filenames in the quickfix
" list
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction


" BufOnly.vim  -  Delete all the buffers except the current/named buffer.
"
" Copyright November 2003 by Christian J. Robinson <infynity@onewest.net>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Bonly / :BOnly / :Bufonly / :BufOnly [buffer] 
"
" Without any arguments the current buffer is kept.  With an argument the
" buffer name/number supplied is kept.

command! -nargs=? -complete=buffer -bang Bonly :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
	if a:buffer == ''
		" No buffer provided, use the current buffer.
		let buffer = bufnr('%')
	elseif (a:buffer + 0) > 0
		" A buffer number was provided.
		let buffer = bufnr(a:buffer + 0)
	else
		" A buffer name was provided.
		let buffer = bufnr(a:buffer)
	endif

	if buffer == -1
		echohl ErrorMsg
		echomsg "No matching buffer for" a:buffer
		echohl None
		return
	endif

	let last_buffer = bufnr('$')

	let delete_count = 0
	let n = 1
	while n <= last_buffer
		if n != buffer && buflisted(n)
			if a:bang == '' && getbufvar(n, '&modified')
				echohl ErrorMsg
				echomsg 'No write since last change for buffer'
							\ n '(add ! to override)'
				echohl None
			else
				silent exe 'bdel' . a:bang . ' ' . n
				if ! buflisted(n)
					let delete_count = delete_count+1
				endif
			endif
		endif
		let n = n+1
	endwhile

	if delete_count == 1
		echomsg delete_count "buffer deleted"
	elseif delete_count > 1
		echomsg delete_count "buffers deleted"
	endif

endfunction

" Auto close the preview window that YCM opens
autocmd CompleteDone * pclose


" Expand region setting
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Custom syntastic settings:
"
let g:syntastic_javascript_checkers = ['jshint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

function s:find_jshintrc(dir)
  let l:found = globpath(a:dir, '.jshintrc')
  if filereadable(l:found)
    return l:found
  endif

  let l:parent = fnamemodify(a:dir, ':h')
  if l:parent != a:dir
    return s:find_jshintrc(l:parent)
  endif

  return "~/.jshintrc"
endfunction

function UpdateJsHintConf()
  let l:dir = expand('%:p:h')
  let l:jshintrc = s:find_jshintrc(l:dir)
  let g:syntastic_javascript_jshint_args = l:jshintrc
endfunction

au BufEnter * call UpdateJsHintConf()

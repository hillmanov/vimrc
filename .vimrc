" -----------------------------------------------------
" Plugins
" -----------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-speeddating'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'junegunn/vim-easy-align'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'digitaltoad/vim-pug'
Plug 'Raimondi/delimitMate'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'gregsexton/MatchTag'
Plug 'tmhedberg/matchit'
Plug 'rking/ag.vim'
Plug 'dbakker/vim-projectroot'
Plug 'kshenoy/vim-signature' " Adds label in gutter for marks 
Plug 'wellle/targets.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'terryma/vim-expand-region'
Plug 'benekastah/neomake'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'AndrewRadev/sideways.vim'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'

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
set guifont=FantasqueSansMono\ Nerd\ Font:h14
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set relativenumber              " Relative line numbers

set scrolljump=1                " Lines to scroll when cursor leaves screen
set scrolloff=8                 " Minimum lines to keep above and below cursor
set nowrap                      " Don't wrap long lines Don't
set nocursorcolumn
set cursorline

" Automatically change the current directory
" Had to do it on insert enter. autochdir didn't work properly with path
" completion for some reason
autocmd InsertEnter * silent! lcd %:p:h

" -----------------------------------------------------
" Syntax, highlighting and spelling
" -----------------------------------------------------
syntax on
syntax sync minlines=256
colorscheme gruvbox
set background=dark
set nospell                     " Spell checking on

"Checking to see if this will help remove some "nanny" messages
set autowrite

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
set clipboard=unnamed
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
set timeoutlen=350

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

set undofile                                            " save central undo files
" set shortmess=a                                         " Turn off the "Press ENTER or command to continue message"
" set cmdheight=2
set undodir=~/.vim/tmp/undo/
set backup                                              " enable backups
set backupdir=~/.vim/tmp/backup/
set virtualedit=onemore                                 " Allow for cursor beyond last character
set nojoinspaces                                        " Don't add more spaces with joing lines with <S-J>
set shortmess=I                                         " Don't show the intro message on startup
set showcmd
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
noremap <Leader>c <C-w>q
noremap <Leader>X :BufOnly<CR>

" Replace current word with what is in the clipboard
nnoremap <Leader>s "_diwP

" Move lines around with Ctrl j and k in any mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Formated pasted text automatically
" nnoremap p p=`]

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
nmap <expr> M ':%s/' . @/ . '//g<left><left>'

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
nmap <C-l> <RIGHT> :cnext<CR>
nmap <C-h> <LEFT> :cprev<CR>

tnoremap jk <c-\><c-n>
" -----------------------------------------------------
" PLugin settings
" -----------------------------------------------------
" NERFTree customizations
map <C-n> :exe 'NERDTreeToggle ' . <SID>fzf_root()<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\~$', '\.swp$', '^\.git$','^node_modules$', '^\.DS_Store$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" FZF customizations" 
" This is the default extra key bindings
let $FZF_DEFAULT_COMMAND='ag -g ""'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~20%' }

" For Commits and BCommits to customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Advanced customization using autoload functions
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Normal mode completion
fun! s:fzf_root()
	let path = finddir(".git", expand("%:p:h").";")
	return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfun

nnoremap <silent> <Leader>f :exe 'Files ' . <SID>fzf_root()<CR>

" Insert mode completion
imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Start ieteractive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

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

let g:SuperTabDefaultCompletionType = '<C-j>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

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


" BufOnly.vim  Delete all the buffers except the current/named buffer.
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

function! EslintFix()
    let l:winview = winsaveview()
    silent !eslint --fix %
    call winrestview(l:winview)
endfunction
command! EslintFix :call EslintFix()

function! Lebab()
    let l:winview = winsaveview()
    silent !lebab % -o % --transform arrow,let,arg-spread,obj-method,obj-shorthand,template
    call winrestview(l:winview)
endfunction
command! Lebab :call Lebab()

let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2

" Sideways config
nnoremap <leader><leader>h :SidewaysLeft<cr>
nnoremap <leader><leader>l :SidewaysRight<cr>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" Use deoplete
let g:deoplete#enable_at_startup = 1

" use tab to forward cycle
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<c-d>"

let g:jsx_ext_required = 0



" tern and JavaScript

autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
let g:tern_map_prefix = '<leader>'

nnoremap <leader><leader>d :TernDef<CR>
nnoremap <leader><leader>r :TernRefs<CR>
nnoremap <leader><leader>R :TernRename<CR>



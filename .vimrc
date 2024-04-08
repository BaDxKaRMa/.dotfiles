" karma vimrc file
" Basic Setup {{{
:scriptencoding utf-8   " set encoding for vimrc
syntax enable           " enable syntax processing
colo monokai_pro
set cursorline          " highlight current line
set nocompatible
set path+=**            " add pwd to path for auto recurse
" }}}
" Misc {{{
set backspace=indent,eol,start
set termguicolors
" }}}
" Spaces & Tabs {{{
filetype indent on
filetype plugin on
set tabstop=4           " How many spaces is a tab worth
set shiftwidth=4		" How many spaces is one indent worth
set softtabstop=0
set autoindent
set noexpandtab			" Don't expand tabs to spaces
" }}}
" UI Layout {{{
set number relativenumber              " show line numbers
set nu rnu
set showcmd             " show command in bottom bar
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:┃
" }}}
" Statusline {{{
set laststatus=2
set statusline=
set statusline+=%2*
set statusline+=%{StatuslineMode()}
set statusline+=%1*
set statusline+=\       "add space
set statusline+=<
set statusline+=<
set statusline+=\ 
set statusline+=%f      " file name
set statusline+=\ 
set statusline+=>
set statusline+=>
set statusline+=%=      " alignment seperator
set statusline+=%m      " modified flag
set statusline+=%h      " help flag
set statusline+=%r      " read only flag
set statusline+=\ 
set statusline+=%3*
set statusline+=%{b:gitbranch}
set statusline+=%1*
set statusline+=\ 
set statusline+=%4*
set statusline+=%F      "Full path to file
set statusline+=:
set statusline+=:
set statusline+=%5*
set statusline+=%l      " line number
set statusline+=/
set statusline+=%L      " total lines
set statusline+=[
set statusline+=%p      " percent of file
set statusline+=%%
set statusline+=]
set statusline+=%1*
set statusline+=|
set statusline+=%y      " file type
set statusline+=%2*
set statusline+=%2*
set statusline+=%3*
set statusline+=%5*
set statusline+=%4*
set statusline+=%2*
set statusline+=%1*
set statusline+=%2*
hi User2 ctermbg=lightgreen ctermfg=black guibg=lightgreen guifg=black
hi User1 ctermbg=black ctermfg=white guibg=NONE guifg=white
hi User3 ctermbg=black ctermfg=lightblue guibg=NONE guifg=lightblue
hi User4 ctermbg=black ctermfg=lightgreen guibg=NONE guifg=lightgreen
hi User5 ctermbg=black ctermfg=magenta guibg=NONE guifg=magenta

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  elseif l:mode==?"\<C-V>"
    return "VBLOCK"
  endif
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="(".substitute(l:gitrevparse, '
', '', 'g').") "
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END
" }}}
" Cursor {{{
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
set scrolloff=10
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" File Browsing {{{
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" }}}
" Folding {{{
"=== folding ===
set foldmethod=marker   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=0   " start with fold level of 1
" }}}
" Leader Shortcuts {{{
let mapleader=","
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>m :set nu! rnu!<CR>
nnoremap <leader>r :!clear;./%<CR>
nnoremap <leader>d :!clear;./% --debug<CR>
nnoremap <leader>i :!clear;python -i ./%<CR>
" }}}
" Keyboard Shortcuts {{{
:imap ii <Esc>
:inoremap <C-d> <Del>
" }}}
function! NeatFoldText() " {{{
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}
" Marker {{{
" vim:foldmethod=marker:foldlevel=0
" }}}

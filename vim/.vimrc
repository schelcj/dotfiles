set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'vimoutliner/vimoutliner'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'corntrace/bufexplorer'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/Dpaste.com-Plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'vim-scripts/gnupg'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'garbas/vim-snipmate'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/taglist.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'vim-scripts/vcscommand.vim'
Plugin 'vim-perl/vim-perl'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/vim-pad'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'perlhelp.vim'
call vundle#end()
filetype plugin indent on

syn on
set shell=/bin/bash
set ts=2
set shiftwidth=2
set si
set expandtab
set ruler
set nowrap
set showcmd
set sidescroll=2
set foldmethod=indent
set mps=(:),{:},[:],<:>
set commentstring=\ #\ %s
set ignorecase smartcase
set hlsearch
set incsearch
set mouse=a
set nu
set backupdir=~/tmp
set directory=~/tmp
set cursorline

if v:version >= 703
  set colorcolumn=80
endif

autocmd FileType perl set keywordprg=perldoc\ -f
autocmd FileType javascript set commentstring=\ //\ %s
autocmd FileType diff set foldmethod=manual
autocmd FileType actionscript set syntax=actionscript

filetype indent on
filetype plugin on

map <C-t> :TlistToggle<CR>

"let Tlist_Use_Horiz_Window=1
"let perl_include_pod=1

""trick from ovid
noremap <Leader>w <C-W><C-W>:res<cr>

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" another ovid trick, runs test in just the method you are working
" " on in a Test::Class module
" " noremap <buffer> <leader>tm ?^sub.*:.*Test<cr>w"zye:!TEST_METHOD='<c-r>z'
" prove -v %<cr>
"
" " quickly tidy our current buffer of perl code
au Filetype perl nmap <leader>T :%!perltidy<CR>

au BufRead,BufNewFile *.t set ft=perl
au BufRead,BufNewFile *.ep set ft=html
filetype plugin indent on
syntax on

au Filetype xml nmap <leader>px :%!xmllint % --format<CR>

map <Leader><Right> :tabn<CR>
map <Leader><Left>  :tabp<CR>

" NERDTree settings
nmap <Leader>N :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="high"
colorscheme solarized

let g:ackprg="/home/schelcj/perl5/bin/ack"

let g:GPGDefaultRecipients=["D6776630"]

" ctrlp options
set wildignore+=*/tmp/*,*/Drive/*,*.so,*.swp,*.zip,*/bower_components/*,*/node_modules/*,*/local/*
let g:ctrlp_custom_ignore={
  \'dir': '\v[\/]\.(git|hg|svn)$',
  \}

" Conway tips/tricks
"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" need to turn off the list chars for vimoutliner, lots of hard tabs in there
augroup VO
  au! BufRead,BufNewFile *.otl set nolist
augroup end

" Ovid's variable highlighting function
" http://blogs.perl.org/users/ovid/2014/05/automatic-variable-highlighting-in-vim.html
" Drop this into .vim/plugin.vawa.vim
" if you already have vawa.vim, rename appropriately
" automatically highlights variables under cursor, allowing you to easily see the data flow.

" Vawa Plugin for VIM > 7.3 version 1.00
" Maintainer: Sandeep.c.r<sandeepcr2@gmail.com>
" Hacked for Perl by Curtis "Ovid" Poe <ovid@allaroundtheworld.fr>

function! s:vawa()
    call clearmatches()
    let s:temp          = getpos('.')
    let s:current_col   = s:temp[2]
    let s:current_line  = s:temp[1]
    let s:temp          = searchpos('[>$@%*&]','bcn')
    let s:sigil_line    = s:temp[0]
    let s:sigil_col     = s:temp[1]
    if(s:sigil_line != s:current_line)
        return
    endif
    let s:temp = getbufline(bufnr('%'),line('.'))
    let s:varend = match(s:temp[0], '[^a-zA-Z0-9_\x7f-\xff]\|\n', s:sigil_col)+1
    let s:space_col = s:varend
    if((s:space_col > s:sigil_col) && ( s:space_col< s:current_col))
        return
    endif
    if(s:varend == 0)
        let s:varend = strlen(s:temp[0])+1
    endif
    let s:current_char = s:temp[0][s:current_col-1]
    if(s:current_char == '>' || s:current_char == '-')
        return
    endif
    if(exists("g:vawahl"))
        exe "highlight VarHl  " . g:vawahl
    else
        highlight VarHl  ctermbg=black ctermfg=red guifg=#ff0000 guibg=#000000 ctermfg=LightRed gui=bold
    endif
    let s:str = strpart(s:temp[0], s:sigil_col-1,(s:varend - s:sigil_col))
    let s:prefix = ''
    if(exists("g:vawanohlcurrent") && (g:vawanohlcurrent == 1))
        let s:lineab = s:current_line - 1
        let s:linebe = s:current_line + 1
        let s:colbf  = s:sigil_col + 1
        let s:prefix = '\(\%>'.s:lineab.'l.\%<'.s:linebe.'l.\%>'.s:colbf.'c\)\@!'
    endif
    if(s:str == '$')
        return
    endif
    if(strpart(s:str,0,1) == '>')
        let s:str = strpart(s:str ,1)
        call matchadd('VarHl', s:prefix.'>\@<='. s:str.'\n\{-\}\(\([^a-zA-Z0-9_\x7f-\xff]\)\|$\)\@=')
    else
        call matchadd('VarHl', s:prefix.s:str.'\n\{-\}\(\([^a-zA-Z0-9_\x7f-\xff]\)\|$\)\@=')
    endif
endfunction
if(!exists("g:vawanoauto") || (g:vawanoauto == 1))
    augroup HighlightVar
            autocmd!
            au CursorMoved  *.pl call <sid>vawa()
            au CursorMovedi *.pl call <sid>vawa()
            au CursorMoved  *.pm call <sid>vawa()
            au CursorMovedi *.pm call <sid>vawa()
            au CursorMoved  *.t  call <sid>vawa()
            au CursorMovedi *.t  call <sid>vawa()
    augroup END
endif

command! Vawa :call <sid>vawa()

map <F9> :DiffGitCached<CR>
augroup GO
  au! BufRead,BufNewFile *.go set nolist
augroup end

call mywikis#load()

noremap <F3> :noh<CR>

iab <expr> dts strftime("%c")

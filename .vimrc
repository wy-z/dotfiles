""" https://github.com/wy-z/vimrc.git
source /Users/weiyang/.vim_runtime/vimrc
""" end

"
" Basic
"

set number
set mouse=a
set exrc
set undodir=~/.cache/undo-dir
set undofile
set ignorecase
set smartcase
set autoread

let mapleader = "\<space>"
let g:mapleader = "\<space>"
imap fd <Esc>

" FileTypes
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType sh setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType proto setlocal ts=4 sts=4 sw=4 expandtab

" Highlight
set colorcolumn=80,100
set cursorline
set cursorcolumn
au BufWinEnter * if &filetype == '' | setlocal nocursorline nocursorcolumn colorcolumn= | endif

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Folding
set foldmethod=indent
set foldopen=all

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>


"
" Plugin
"

" Plug
call plug#begin('~/.cache/plugged')

" Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination.
Plug 'terryma/vim-expand-region'

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'

" " Asynchronous linting and make framework
Plug 'neomake/neomake'

" Improved incremental searching for Vim
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/is.vim'

" commentary.vim: comment stuff out
Plug 'tpope/vim-commentary'
" Surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" Repeat.vim: enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'
" sleuth.vim: Heuristically set buffer options
Plug 'tpope/vim-sleuth'

" A Vim plugin that manages your tag files
Plug 'ludovicchabant/vim-gutentags'

" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer' }

" The missing motion for Vim
Plug 'justinmk/vim-sneak'

" Vim plugin for cmac_idopying to the system clipboard with text-objects and motions
Plug 'christoomey/vim-system-copy'

" An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'dyng/ctrlsf.vim'

" Go development plugin for Vim
Plug 'fatih/vim-go'

" If installed using Homebrew
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'yggdroot/indentline'

" Vim configuration for Rust
Plug 'rust-lang/rust.vim'

" Make Vim persist editing state without fuss
Plug 'zhimsel/vim-stay'

" Range, pattern and substitute preview for Vim
Plug 'markonm/traces.vim'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" The vim source for neocomplete/deoplete
Plug 'Shougo/neco-vim'

" Initialize plugin system
call plug#end()


" YCM
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" Vim-Go
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 0
let g:go_def_mapping_enabled = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_list_type = "quickfix"

" Vim-Gitgutter
set updatetime=250
let g:gitgutter_enabled = 1

" incsearch.vim
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)

" fzf
let g:fzf_buffers_jump = 1
nmap <leader>j :Files<cr>
nmap <leader>k :BTags<cr>
nmap <leader>/ :BLines<cr>

" ripgrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m

    " Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
    command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%:hidden', '?'),
        \   <bang>0)
endif

" Vim expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" neomake
call neomake#configure#automake('w')
let g:neomake_open_list = 1
let g:neomake_go_golint_maker = {
  \ 'exe': 'revive',
  \ 'errorformat':
            \ '%I%f:%l:%c: %m,' .
            \ '%-G%.%#'
  \ }
let g:neomake_go_enabled_makers = ['go', 'golint', 'govet']
let g:neomake_python_yapf_maker = {'exe': 'yapf', 'args': ['--in-place']}
let g:neomake_python_isort_maker = {'exe': 'isort'}
let g:neomake_python_enabled_makers=['yapf', 'isort', 'flake8', 'mypy']
let g:neomake_sh_shfmt_maker = {'exe': 'shfmt', 'args': ['-w', '-i', '4', '-s']}
let g:neomake_sh_enabled_makers=['sh', 'shellcheck']
augroup neomake_hooks
  au!
  autocmd User NeomakeJobFinished :checktime
augroup END
if has("nvim")
  au FocusGained * :checktime
endif

" Vim sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#s_next = 1
nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_s
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" ctrlsf.vim
nmap     <leader>ff <Plug>CtrlSFPrompt
vmap     <leader>ff <Plug>CtrlSFVwordPath
nnoremap <leader>fo :CtrlSFOpen<CR>
nnoremap <leader>ft :CtrlSFToggle<CR>

" indentline
let g:indentLine_enabled = 1
let g:indentLine_setColors = 1

" vim-script
autocmd FileType vim setlocal omnifunc=VimComplete
function! VimComplete( findstart, base ) abort
   let line_prefix = s:get_input()
   if a:findstart
   let ret = necovim#get_complete_position( line_prefix )
   if ret < 0
    return col( '.' ) " default to current
  endif
   return ret
  else
   return necovim#gather_candidates( line_prefix . a:base, a:base )
  endif
 endfunction

 " vim-gutentags
 let g:gutentags_cache_dir = '~/.cache/tags'

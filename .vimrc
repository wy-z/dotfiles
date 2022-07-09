source ~/.vimrc-pers/vimrc

if exists("g:neovide")
    set guifont=Hack\ Nerd\ Font:h13
    autocmd VimEnter * call timer_start(600, { -> execute('let g:neovide_fullscreen=v:true')})
endif

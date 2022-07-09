source ~/.vimrc-pers/vimrc

if exists("g:neovide")
    set guifont=Hack\ Nerd\ Font:h13
    call timer_start(620, { -> execute('let g:neovide_fullscreen=v:true')})
endif

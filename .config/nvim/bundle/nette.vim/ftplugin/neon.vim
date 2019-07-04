" File:             ftplugin/neon.vim
" Maintainer:       Filip Pobořil <tsuki@fpob.eu>

augroup NetteNeonFtplugin
    autocmd!

    autocmd BufWritePost *.neon execute 'NetteNeonCheck'
augroup END

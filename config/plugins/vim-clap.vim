nmap <C-l> : Clap files -H --no-heading --vimgrep --smart-case --hidden -g '!.git/'<CR>
augroup Clap
    autocmd User ClapOnEnter call g:clap.display.setbufvar('&syntax', '')
augroup END
let clap_current_selection_sign={'text': ' ', 'textthl': 'WarningMsg', 'linehl': 'ClapInput'}

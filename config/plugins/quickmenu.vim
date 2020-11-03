" QuickMenu配置
scriptencoding UTF-8
let g:quickmenu_options = 'HL'

call quickmenu#reset()

call quickmenu#append('# Debug', '')
call quickmenu#append('Run %{expand("%:t")}', '!./%', 'Run current file')

call quickmenu#append('# Git', '')
call quickmenu#append('git diff', 'Gvdiff', 'use fugitive"s Gvdiff on current document')
call quickmenu#append('git status', 'Gstatus', 'use fugitive"s Gstatus on current document')

call quickmenu#append('# Misc', '')
call quickmenu#append('Turn paste %{&paste? "off":"on"}', 'set paste!', 'enable/disable paste mode (:set paste!)')
call quickmenu#append('Turn spell %{&spell? "off":"on"}', 'set spell!', 'enable/disable spell check (:set spell!)')
call quickmenu#append('Function List', 'Vista!!', 'Switch Vista on/off')
call quickmenu#append('DiffOrig', 'DiffOrig', 'Diff file with original.')

call quickmenu#append('# IndentLines', '')
call quickmenu#append('IndentLinesToggle', 'IndentLinesToggle', 'ToggleIndentLines')

call quickmenu#append('# Clip', '')
call quickmenu#append('ClipAdd', ' : set clipboard+=unnamed', 'Clip')
call quickmenu#append('ClipRmv', ' : set clipboard-=unnamed', 'Clip')

call quickmenu#append('# ColorScheme', '')
call quickmenu#append('Light', ' : set background=light | color flattened_light', 'ColorScheme')
call quickmenu#append('Dark', ' : set background=dark | color flattened_dark', 'ColorScheme')

command! QM : call quickmenu#toggle(0)

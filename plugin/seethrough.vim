if exists('g:loaded_seethrough')
  finish
endif
let g:loaded_seethrough = 1

function! s:apply() abort
  highlight Normal ctermbg=NONE guibg=NONE
  highlight NonText ctermbg=NONE guibg=NONE
  highlight EndOfBuffer ctermbg=NONE guibg=NONE
  highlight Folded ctermbg=NONE guibg=NONE
  highlight LineNr ctermbg=NONE guibg=NONE
  highlight CursorLineNr ctermbg=NONE guibg=NONE
  highlight SpecialKey ctermbg=NONE guibg=NONE
  highlight VertSplit ctermbg=NONE guibg=NONE
  highlight SignColumn ctermbg=NONE guibg=NONE
  highlight Statusline cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
  highlight StatuslineNC cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
  highlight Tabline cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
  highlight TablineSel cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
  highlight TablineFill cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
  highlight ALEErrorSign ctermbg=NONE guibg=NONE
  highlight ALEWarningSign ctermbg=NONE guibg=NONE
  highlight GitGutterAdd ctermbg=NONE guibg=NONE
  highlight GitGutterChange ctermbg=NONE guibg=NONE
  highlight GitGutterChangeDelete ctermbg=NONE guibg=NONE
  highlight GitGutterDelete ctermbg=NONE guibg=NONE
endfunction

let g:seethrough_disabled = get(
      \ g:, 'seethrough_disabled',
      \ has('gui') || exists('g:GuiLoaded') || exists('$SSH_CONNECTION'),
      \)

if !get(g:, 'seethrough_disabled')
  augroup seethrough
    autocmd! *
    autocmd ColorScheme * call timer_start(0, { -> s:apply() })
  augroup END
  call s:apply()
endif

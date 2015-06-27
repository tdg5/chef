let s:calls_for_block = 0

function! BlockShiftGuard(size)
  let s:calls_for_block = s:calls_for_block + 1

  if s:calls_for_block < a:size
    return 0
  endif

  let s:calls_for_block = 0

  return 1
endfunction

function! BlockShiftUp()
  let l:size = a:lastline - a:firstline + 1

  if !BlockShiftGuard(l:size)
    return
  endif

  call cursor(a:firstline, 0)
  execute 'normal! ' . l:size . 'dd'

  if 1 < a:firstline
    call cursor(a:firstline - 1, 0)
  endif
  execute 'normal! P'

  if 1 < l:size
    execute 'normal! V' . (l:size - 1) . 'j'
  else
    execute 'normal! V'
  endif
endfunction

function! BlockShiftDown()
  let l:size = a:lastline - a:firstline + 1

  if !BlockShiftGuard(l:size)
    return
  endif

  call cursor(a:firstline, 0)
  execute 'normal! ' . l:size . 'dd'
  execute 'normal! p'

  if 1 < l:size
    execute 'normal! V' . (l:size - 1) . 'j'
  else
    execute 'normal! V'
  endif
endfunction

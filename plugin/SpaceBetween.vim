function! s:SpaceBetween()
	" Save cursor position
	let l:save_cursor = getpos(".")
  call s:SpaceBetweenEquals()
  call s:SpaceBetweenBlocks()
  call s:SpaceBetweenCommas()

   " Restore cursor position
	call setpos('.', l:save_cursor)
endfunction

function! s:SpaceBetweenEquals()
  " fix sapaces in asgination ex a=1 or a= 1 or a =1 become a = 1
   %s/\(\S\)\s=\(\S\)/\1 = \2/g
   %s/\(\S\)=\s\(\S\)/\1 = \2/g
   %s/\(\S\)=\(\S\)/\1 = \2/g
endfunction

function! s:SpaceBetweenBlocks()
  " fix space after { and and before }
  %s/\([{]\)\(\S\)/\1 \2/g
  %s/\(\S\)\([}]\)/\1 \2/g
endfunction

function! s:SpaceBetweenCommas()
 " fix space after ,
  %s/\(\S\),\(\S\)/\1, \2/g

endfunction

autocmd BufWritePre *.rb SpaceBetween
command! -range=% SpaceBetween :silent! call <SID>SpaceBetween()
command! -range=% SpaceBetweenEquals :silent! call <SID>SpaceBetweenEquals()
command! -range=% SpaceBetweenBlocks :silent! call <SID>SpaceBetweenBlocks()
command! -range=% SpaceBetweenCommas :silent! call <SID>SpaceBetweenCommas()


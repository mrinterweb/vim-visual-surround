if exists("g:loaded_visual_surround") || &cp || v:version < 700
  finish
endif
let g:loaded_visual_surround = 1

function! s:wrap_visual_selection(chr)

  let chr = a:chr

  if chr == '{'
    let end_chr = '}' 
  elseif chr == '['
    let end_chr = ']'
  elseif chr == '('
    let end_chr = ')'
  elseif chr == '"'
    let end_chr = '"'
  elseif chr == "'"
    let end_chr = "'"
  else
    return
  endif

  try
    let register_save = @b
    normal! gv"by
    let @b = chr.@b.end_chr
    normal! gvd
    " The following logic helps determine if the cursor is at the end of line
    if col('.') + 1 >= col('$')
      normal! "bp
    else
      normal! "bP
    endif
  finally
    let @b = register_save
  endtry
endfunction

vmap { :call <SID>wrap_visual_selection('{')<CR>
vmap [ :call <SID>wrap_visual_selection('[')<CR>
vmap ( :call <SID>wrap_visual_selection('(')<CR>
vmap " :call <SID>wrap_visual_selection('"')<CR>
vmap ' :call <SID>wrap_visual_selection("'")<CR>

vmap } :call <SID>wrap_visual_selection('{')<CR>
vmap ] :call <SID>wrap_visual_selection('[')<CR>
vmap ) :call <SID>wrap_visual_selection('(')<CR>

" if you use Ctrl+c for copy to OS paste buffer, use the following mapping:
" vnoremap <C-c> "+yi

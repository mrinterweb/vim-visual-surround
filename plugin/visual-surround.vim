" visual-surround.vim - Visual Surround
" Author: Sean McCleary
" Version: 0.01
" GetLatestVimScripts: 1697 1 :AutoInstall: surround.vim

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
    let register_save_2 = @x
    " set mark 'x'
    normal! mx
    let cursor_pos = col("'x")
    let line_end_pos = col("$")
    " yank the visual selection and stuff it in the 'b' register
    normal! gv"by
    " Get rid of new line character

    let @b = substitute(@b, '\n', '', '')
    " Insert surrounding characters
    let @b = chr.@b.end_chr
    " delete the visual selection
    normal! gvd

    let cursor_pos = col(".")
    let total = cursor_pos + len(@b) - 2
    "" -- Debugging
    " echom "cursor_pos: " . cursor_pos
    " echom "line_end_pos: " . line_end_pos
    " echom "len: " . len(@b)
    " echom "total type: " . type(total)
    " echom "total >= line_end_pos ? " . (total >=# line_end_pos)
    " echom "cursor_pos + len(@b): " . total 
    " echom @b

    " paste 'b' buffer. Mark b where cursor is. Use 'o' to insert new line
    normal! "bP 
    " return to 'x' mark
    normal! ~x

    " " The following logic helps determine if the cursor is at the end of line
    if total >= line_end_pos
      " Insert a newline after the last position 
      exec 'normal!'."a \<CR>" 
    endif
  finally
    let @b = register_save
    let @x = register_save_2
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

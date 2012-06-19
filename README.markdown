visual-surround.vim
============

The Visual surround surrounds visually selected text with parentheses, 
brackets, curly brackets, and quotations when one of the following keys is pressed:
',",(,),[,],{,}

This behavior was intended to replicate functionality of how some other editors
automatically surround selected text when certain characters are typed.

Tim Pope's surround plugin inspired me to write this plugin. I enjoy the surround
plugin, but I felt it did not match my workflow. The code for this plugin was 
losely based on the surround plugin.

Disclaimer
----------

This project is very young, and I can't guarantee that this plugin will not break
expected vim behavior. Some of the keymapping override default movement behavior of {,},(,).

Installation
------------

If you don't have a preferred installation method, I recommend
installing [pathogen.vim](https://github.com/tpope/vim-pathogen), and
then simply copy and paste:

    cd ~/.vim/bundle
    git clone git://github.com/mrinterweb/vim-visual-surround.git

Once help tags have been generated, you can view the manual with
`:help visual-surround`.

License
-------

Copyright (c) Sean McCleary.  Distributed under the same terms as Vim itself.
See `:help license`.

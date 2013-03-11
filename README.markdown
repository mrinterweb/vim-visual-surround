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

I like to use Vundler to manage plugins in vim https://github.com/gmarik/vundle.
Vundler is like ruby's bundler gem but for vim.

With vundler, add the following to your ~/.vimrc

    Bundle 'mrinterweb/vim-visual-surround.git'

Then run `:BundleInstall`
That's it.

Usage
------

Select some text in visual mode, then hit one of the keys you want to surround the text.

What does not work
------------------

* Multi-line surrounds do not work yet.
* Other stuff. This is pretty raw. Take warning.

License
-------

Copyright (c) Sean McCleary.  Distributed under the same terms as Vim itself.
See `:help license`.

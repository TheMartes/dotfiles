nette.vim
=========

Vim plugin for [Nette Framework](https://github.com/nette/nette).

Features
--------

* Syntax highlight and indentation for [NEON](https://github.com/nette/neon)
* Syntax highlight for [Latte](https://github.com/nette/latte)
* Indentation check in NEON files - command `NetteNeonCheck`. Calls every time when file is saved.
* Error-highlight deprecated macros, filters, etc. in Latte

Configuration
-------------

Disable error-highlight:
```
let g:nette_deprecated = 0
```

Installation
------------

If you don't have a preferred installation method, one option is to install
[pathogen.vim](https://github.com/tpope/vim-pathogen), and then copy and paste:

```
cd ~/.vim/bundle
git clone https://github.com/fpob/nette.vim
```

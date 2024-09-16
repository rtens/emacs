# .emacs.d

This is my attempt of keeping a consistent editor configuration across systems.

## Sources

Here are a couple of good sources

- [emacsrocks (magnars)](https://github.com/magnars/.emacs.d/)
- [emacs4developers](https://github.com/pierre-lecocq/emacs.d)
- [Parens of the Dead](https://www.parens-of-the-dead.com/)

## Init cascade

Init files (if existing) are loaded in this order:

- `~/.emacs.d/init.el`
- `~/.emacs.d/custom.el` - contains default customizations
- `~/.emacs.d/custom-local.el` - is set as `custom-file`
- `~/.emacs.d/init-local.el` - setting for the local system
- `./.emacs-project.el` - settings for the project
- `./.emacs-local.el` - local setting for the project (add to .gitignore)

## Cheat sheet

- basics
    - exit `C-x C-c`
    - open/create file `C-x C-f`
    - save file `C-x C-s`
    - close buffer `C-x k`
- windows
    - split right `C-x 3`
    - split down `C-x 2`
    - next window `C-x o`
    - close current window `C-x 0`
    - close other windows `C-x 1`
    - move buffer `C-s-ARROW`
    - back/forward windows configs `C-x ARROW`
- file management
    - jump to project root `C-x C-j`
    - create folder `+`
    - delete file `D`
- text manipulation
    - indent region
        - interactively `C-x TAB`
        - by 2 space in and out
    - duplicate lines `C-M-UP/DOWN`
    - move line `M-UP/DOWN`
    - kill line `C-k C-k`
    - search and replace `M-%`
        - with regex `C-M-%`
        - capture groups `\(.+\)` > `\1`
    - comment lines `C-x /`
- cursor
    - multi cursor
        - per line in region `C-c c`
        - next like this or line `C-c n/p`
        - next symbol `C-c f/b`
        - all symbols `C-c a`
    - expand region `C-c g`
- navigate in buffer
    - collapse everything `C-c h H`
    - expand next level `C-c h l`
    - expand block `C-c h s`
    - search for string `C-s` `C-r`
    - jump to char `C-c SPC`
- navigate in project
    - search file `C-x p f`
        - including line numbers
    - full-text search `C-x p g`
- terminal
    - open shell `M-x term|shell|eshell`
    - goto error line
- execution
    - eval at point `C-x C-e`
    - eval `M-:`
    - repeat command `C-x z`
- git `C-x g`
- refactoring
- snippets
    - class
    - method
    - constructur
    - this/self
    - test

## To explore

- yasnippet
- dump-jump

## Open questions

- register a window configuration
    - for the session?
    - for the project?
- navigation in buffer
    - collapse everything
    - move to word / char quickly
    - expand everything under point
- full text search in project
- jump to file in project (typing just about any part of its path)
- indent multiple lines
- browse with file tree
- jump to error line
- refactoring
    - javascript
    - python
- quickly find methods of type
    - auto-complete for known type
- jump between projects
    - restore windows
    - load project init file
    - have multiple projects open
- format buffer
    - javascript
    - python (using local config as in pre-commit hook)
    - JSON `M-x js-json-mode RET M-x json-pretty-print-buffer`
- automatically add import
- remove unsused imports
- comment multiple lines
- go to definition
- find usages
- jump back and forwards marks
- move buffer to other/new window
- change window by number
- dir local instead of init file cascade

;; Use tabs
(setq-default indent-tabs-mode t)
(setq-default tab-width 2)

;; Make pairs close automatically
(electric-pair-mode 1)
(setq electric-pair-pairs (append electric-pair-pairs '((?` . ?`))))

;; Set locale to UTF8
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Use unix-style line endings (LF)
(set-default buffer-file-coding-system 'utf-8-unix)

;; Cleanup whitespaces on save
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Insert final newlines automatically on save
(setq require-final-newline t)

;; Overwrite selected region
(pending-delete-mode t)

;; Set mark
(my-key-one "M-q" 'set-mark-command)

;; Keybindings for movements

;; Units
(defvar char "C-")
(defvar word "M-")
(defvar symbol "C-n C-")
(defvar sexp "C-M-n C-")
(defvar line "C-M-")

;; Actions
(defvar point "")
(defvar select "C-v ")
(defvar add-cursor "M-v ")
(defvar kill "C-d ")
(defvar append-kill "M-d ")
(defvar copy "C-w ")
(defvar append-copy "M-w ")
(defvar move "C-e ")
(defvar duplicate "M-e ")

;; Direction
(defvar left "j")
(defvar right "l")
(defvar up "o")
(defvar down "k")
(defvar begin "u")
(defvar end "p")

;; Move by char
(my-key "char-up" (concat char up)
	'(previous-line))
(my-key "char-down" (concat char down)
	'(next-line))
(my-key "char-left" (concat char left)
	'(left-char))
(my-key "char-right" (concat char right)
	'(right-char))
(my-key "char-begin" (concat char begin)
	'(beginning-of-visual-line))
(my-key "char-end" (concat char end)
	'(end-of-visual-line))

;; Move by word
(my-key "word-left" (concat word left)
	'(right-char)
	'(backward-to-word 1)
	'(left-word))
(my-key "word-right" (concat word right)
	'(forward-to-word 1))
(my-key "word-begin" (concat word begin)
	'(right-char)
	'(left-word))
(my-key "word-end" (concat word end)
	'(left-char)
	'(right-word))

;; Move by symbol
(my-key "symbol-left" (concat symbol left)
	'(right-char)
	'(forward-symbol -2))
(my-key "symbol-right" (concat symbol right)
	'(forward-symbol 2)
	'(forward-symbol -1))
(my-key "symbol-begin" (concat symbol begin)
	'(right-char)
	'(forward-symbol -1))
(my-key "symbol-end" (concat symbol end)
	'(left-char)
	'(forward-symbol 1))

;; Move by line
(my-key "line-left" (concat line left)
	'(forward-line -1))
(my-key "line-right" (concat line right)
	'(forward-line 1))
(my-key "line-up" (concat line up)
	'(scroll-down))
(my-key "line-down" (concat line down)
	'(scroll-up))
(my-key "line-begin" (concat line begin)
	'(beginning-of-buffer))
(my-key "line-end" (concat line end)
	'(end-of-buffer))

;; Move by s-expression
(my-key "sexp-left" (concat sexp left)
	'(backward-sexp))
(my-key "sexp-right" (concat sexp right)
	'(forward-sexp 2)
	'(backward-sexp))
(my-key "sexp-up" (concat sexp up)
	'(backward-up-list))
(my-key "sexp-down" (concat sexp down)
	'(down-list))
(my-key "sex-begin" (concat sexp begin)
	'(backward-up-list)
	'(down-list))
(my-key "sexp-end" (concat sexp end)
	'(backward-up-list)
	'(forward-sexp)
	'(left-char))

;; Kill
(my-key "kill-region-or-line" (concat kill char down)
				'(if (use-region-p)
						 (kill-region nil nil t)
					 (my-kill-line-current)))

;; ... Char
(my-key "kill-char-right" (concat kill char right)
				'(delete-char 1))
(my-key "kill-char-left" (concat kill char left)
				'(delete-char -1))

;; ... Word
(my-key "kill-word-right" (concat kill word right)
				'(my-word-end)
				'(set-mark-command nil)
				'(my-word-right)
				'(my-word-end)
				'(kill-region nil nil t))
(my-key "kill-word-left" (concat kill word left)
				'(my-word-begin)
				'(set-mark-command nil)
				'(my-word-left)
				'(kill-region nil nil t))
(my-key "kill-word-current" (concat kill word down)
				'(my-word-begin)
				'(set-mark-command nil)
				'(my-word-end)
				'(kill-region nil nil t))

;; ... Symbol
(my-key "kill-symbol-right" (concat kill symbol right)
				'(my-symbol-end)
				'(set-mark-command nil)
				'(my-symbol-right)
				'(my-symbol-end)
				'(kill-region nil nil t))
(my-key "kill-symbol-left" (concat kill symbol left)
				'(my-symbol-begin)
				'(set-mark-command nil)
				'(my-symbol-left)
				'(kill-region nil nil t))
(my-key "kill-symbol-current" (concat kill symbol down)
				'(my-symbol-begin)
				'(set-mark-command nil)
				'(my-symbol-end)
				'(kill-region nil nil t))

;; ... Line
(my-key "kill-line-current" (concat kill line down)
				'(my-char-begin)
				'(set-mark-command nil)
				'(my-line-right)
				'(kill-region nil nil t))

;; Move
;; ... Line
(my-key "move-line-up" (concat move char up)
				'(my-kill-line-current)
				'(my-line-left)
				'(yank)
				'(my-line-left))
(my-key "move-line-down" (concat move char down)
				'(my-kill-line-current)
				'(my-line-right)
				'(yank)
				'(my-line-left))

;; Duplicate
;; ... Line
(my-key "duplicate-line-up" (concat duplicate char up)
				'(my-kill-line-current)
				'(yank)
				'(my-line-left)
				'(yank)
				'(my-line-left))
(my-key "duplicate-line-down" (concat duplicate char down)
				'(my-kill-line-current)
				'(yank)
				'(yank)
				'(my-line-left))

;; Copy
(my-key-one "C-w" 'kill-ring-save)

;; Undo and redo
(my-key-one "C-z" 'undo)
(my-key-one "M-z" 'undo-redo)

;; Insert new line
(my-key "insert-line-below" "C-<return>"
	'(end-of-line)
	'(newline)
	'(indent-for-tab-command))
(my-key "insert-line-above" "S-C-<return>"
	'(beginning-of-line)
	'(newline)
	'(forward-line -1)
	'(indent-for-tab-command))
(my-key-one "C-h" 'my-insert-line-below)
(my-key-one "M-h" 'my-insert-line-above)

;; Search and replaec
(my-key-one "M-s" 'isearch-backward)
(my-key-one "C-r" 'query-replace)
(my-key-one "M-r" 'query-replace-regexp)

;; Recenter point
(my-key-one "M-f" 'recenter-top-bottom)

;; Comment-line
(my-key-one "C-x c" 'comment-line)

;; Expand region
(use-package expand-region
	:ensure t
	:bind ("C-v" . 'er/expand-region))

;; Multi-cursor
(use-package multiple-cursors
	:ensure t
	:config
	(let ((prefix add-cursor))
		(my-key-one (concat prefix add-cursor)
		'mc/edit-lines)
		(my-key-one (concat prefix char right)
		'mc/mark-next-like-this)
		(my-key-one (concat prefix char left)
		'mc/mark-previous-like-this)
		(my-key-one (concat prefix word right)
								'mc/mark-next-like-this-word)
		(my-key-one (concat prefix word left)
								'mc/mark-previous-like-this-word)
		(my-key-one (concat prefix symbol right)
								'mc/mark-next-like-this-symbol)
		(my-key-one (concat prefix symbol left)
								'mc/mark-previous-like-this-symbol)
		(my-key-one (concat prefix symbol end)
								'mc/mark-all-symbols-like-this)
		))

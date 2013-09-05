;; When t restricts searching in dired buffer only to file names
(setq dired-isearch-filenames t)

;; Load dired+
(require 'dired+)

;; Reuse buffer with diredp (dired-plus)
(toggle-diredp-find-file-reuse-dir 1)
(define-key dired-mode-map  (kbd "<down-mouse-1>")    'diredp-mouse-find-file-reuse-dir-buffer)

;; Do not line wrap! Otherwise won't scroll when lines are too long
(add-hook 'dired-mode-hook '(lambda () (toggle-truncate-lines 1)))

;; Verbose columns in dired
;; See: http://www.emacswiki.org/emacs/LsLispToggleVerbosity
;; See: http://stackoverflow.com/questions/4115465/emacs-dired-too-much-information
(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program nil)
(custom-set-variables
 '(ls-lisp-verbosity nil))

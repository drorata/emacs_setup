;;;;;;;;;;;;;;;;;;;
;; C++
;;;;;;;;;;;;;;;;;;;

;; Highlight lines of length greater then 80 chars.
(add-hook 'c++-mode-hook
	  '(lambda () (highlight-lines-matching-regexp ".\\{81\\}" 'hi-yellow)))

;; Enable auto save before compilation in c++ mode
(add-hook 'c++-mode-hook '(lambda ()
			    (progn (make-local-variable 'compilation-ask-about-save)
				   (setq compilation-ask-about-save nil))))

(add-hook 'c++-mode-hook
	  (outline-minor-mode 1))

;; Comment/uncomment region
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))

					;(define-key c-mode-base-map (kbd "C-/") 'comment-or-uncomment-region-or-line)

;; Add compiling bindings to C++ mode
(add-hook 'c++-mode-hook
	  '(lambda ()
	     (define-key c++-mode-map "\C-c\C-c" 'compile)
	     (define-key c++-mode-map "\C-c\C-e" 'next-error)
	     (define-key c++-mode-map "\C-c\C-r" 'recompile)
	     (define-key c++-mode-map (kbd "C-/") 'comment-or-uncomment-region-or-line)
	     ))

;; Auto use hs-minor-mode in C++ mode and assign key bindings
;; Enables block fold/unfold
(add-hook 'c-mode-common-hook
	  (lambda()
	    (local-set-key (kbd "C-c <right>") 'hs-show-block)
	    (local-set-key (kbd "C-c <left>")  'hs-hide-block)
	    (local-set-key (kbd "C-c <up>")    'hs-hide-all)
	    (local-set-key (kbd "C-c <down>")  'hs-show-all)
	    (hs-minor-mode t)))

(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

;; Handles TODOS in c++ see
;; http://stackoverflow.com/questions/2367611/emacs-highlighting-todo-only-in-comments for additional options
(require 'fic-mode)
(add-hook 'c++-mode-hook '(lambda () (fic-mode 1)))

;; Add a mark on lines containing TODO string
(defun annotate-todo ()
  "put fringe marker on TODO: lines in the curent buffer"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "TODO:" nil t)
      (let ((overlay (make-overlay (- (point) 5) (point))))
        (overlay-put overlay 'before-string (propertize "A"
                                                        'display '(left-fringe right-triangle)))))))
(add-hook 'c-mode-common-hook 'annotate-todo)

;; Line numbering mode
(add-hook 'c++-mode-hook
 	  (lambda () (linum-mode 1)))

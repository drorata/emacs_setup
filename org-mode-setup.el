;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Mode related
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq load-path (cons "/Users/drorata/Library/elisp/org/org-7.9.2/lisp" load-path))

;; Assigns org-mode to .org files
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Auto enable flyspell-mode
(add-hook 'org-mode-hook 'turn-on-flyspell)

;; Use text-mode abbrev table in org-mode
(add-hook 'org-mode-hook '(lambda () (setq local-abbrev-table text-mode-abbrev-table)))

;; Make use of refTeX in org-mode
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  )
(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; Open indirect buffer in new frame
(setq org-indirect-buffer-display 'new-frame)

;; Set common TAGS
;; Check: http://sachachua.com/blog/2008/01/tagging-in-org-plus-bonus-code-for-timeclocks-and-tags/
(setq org-tag-alist '(("interesting_questions" . ?i)
		      ("mittagseminar" . ?m)
		      ))

;; set latexmk the default LaTeX compiler for org-mode and in general
(setq org-latex-to-pdf-process (list "latexmk -f -pdf %f"))

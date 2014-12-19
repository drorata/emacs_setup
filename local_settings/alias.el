;; Idea taken from http://ergoemacs.org/emacs/emacs_alias.html

(defalias 'mg 'magit-status)
(defalias 'gitst 'magit-status)
(defalias 'git 'magit-status)
(defalias 'ir 'indent-region)
(defalias 'pull 'org-mobile-pull)
;; 2FIX
;; (defalias 'push 'org-mobile-push)
(defalias 'oa 'org-archive-subtree)

; elisp
(defalias 'eb 'eval-buffer)
(defalias 'er 'eval-region)
(defalias 'ed 'eval-defun)
(defalias 'eis 'elisp-index-search)
(defalias 'lf 'load-file)

; minor modes
(defalias 'wsm 'whitespace-mode)
(defalias 'gwsm 'global-whitespace-mode)
(defalias 'vlm 'visual-line-mode)
(defalias 'glm 'global-linum-mode)

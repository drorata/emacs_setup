;; When t restricts searching in dired buffer only to file names
(setq dired-isearch-filenames t)

;; Load dired+
(require 'dired+)

;; Reuse buffer with diredp (dired-plus)
(toggle-diredp-find-file-reuse-dir 1)
(define-key dired-mode-map  (kbd "<down-mouse-1>")    'diredp-mouse-find-file-reuse-dir-buffer)

;; When t restricts searching in dired buffer only to file names
(setq dired-isearch-filenames t)

;; Load dired+
(require 'dired+)

;; Reuse buffer with diredp (dired-plus)
(toggle-diredp-find-file-reuse-dir 1)
(define-key dired-mode-map  (kbd "<down-mouse-1>")
  'diredp-mouse-find-file-reuse-dir-buffer)

;; Do not line wrap! Otherwise won't scroll when lines are too long
(add-hook 'dired-mode-hook
          '(lambda () (toggle-truncate-lines 1)))

(add-hook 'dired-mode-hook
          '(lambda () (dired-hide-details-mode 0)))

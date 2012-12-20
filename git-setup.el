;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Git
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path
	     "~/Library/elisp/magit-1.2.0")
(require 'magit)

(add-hook
 'magit-mode-hook
 (lambda ()
   (setq yas-dont-activate t)))

(add-hook
 'magit-log-edit-mode-hook
 (lambda ()
   (setq fill-column 72)
   (turn-on-auto-fill)))

;; Add flyspell mode to the log edit mode of magit
(add-hook 'magit-log-edit-mode-hook
          (lambda () (flyspell-mode 1)))
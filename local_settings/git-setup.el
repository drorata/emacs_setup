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

;; change magit diff colors
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "lightblue")
     (set-face-foreground 'magit-diff-del "lightred")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))

(global-set-key  (kbd "C-c C-v") 'magit-status)

;; TODO: Disable yasnippet in magit-mode

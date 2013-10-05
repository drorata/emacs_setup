;; Open files by pointing at them
(global-set-key (kbd "C-x f") 'find-file-at-point)

;; Duplicate M-j binding
(global-set-key (kbd "M-RET") 'indent-new-comment-line)

;; Toggle whitespace-mode
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; map the window manipulation keys to meta 0, 1, 2, o
(global-set-key (kbd "s-3") 'split-window-horizontally) ; was digit-argument
(global-set-key (kbd "s-2") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "s-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "s-0") 'delete-window) ; was digit-argument
(global-set-key (kbd "s-o") 'other-window) ; was facemenu-keymap
(defun reverse-other-window() ;; previous window
  (interactive)
  (other-window -1)
  )
(define-key (current-global-map) (kbd "s-O") 'reverse-other-window)

;; Replace dired's M-o
(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "M-o") 'other-window))) ; was dired-omit-mode
;; Replace ibuffer's M-o
(add-hook 'ibuffer-mode-hook (lambda () (define-key ibuffer-mode-map (kbd "M-o") 'other-window))) ; was ibuffer-visit-buffer-1-window
;; To help Unlearn C-x 0, 1, 2, o
(global-unset-key (kbd "C-x 3")) ; was split-window-horizontally
(global-unset-key (kbd "C-x 2")) ; was split-window-vertically
(global-unset-key (kbd "C-x 1")) ; was delete-other-windows
(global-unset-key (kbd "C-x 0")) ; was delete-window
(global-unset-key (kbd "C-x o")) ; was other-window

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Easier buffer switching. In particular next/previous.
(if (eq system-type 'darwin)
    (progn
      (global-set-key (kbd "s-]") 'next-buffer)
      (global-set-key (kbd "s-[") 'previous-buffer)
      ))

;; Move around when having many windows
(global-set-key [M-s-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-s-right] 'windmove-right)        ; move to right window
(global-set-key [M-s-up] 'windmove-up)              ; move to upper window
(global-set-key [M-s-down] 'windmove-down)          ; move to downer window

;; Flyspell correction bind
(setq flyspell-auto-correct-binding (kbd "C-~"))

;; Hide the tool bar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode 0))

;; Slow down the mouse wheel acceleration
(when (boundp 'mouse-wheel-scroll-amount)
  (setq mouse-wheel-scroll-amount '(0.01)))

;;(setq mac-option-modifier 'option)a
;;(setq mac-command-modifier 'meta )
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)

(if (eq system-type 'darwin)
    (progn

      ;; Hide the tool bar
      (when (fboundp 'tool-bar-mode)
        (tool-bar-mode 0))

      ;; Slow down the mouse wheel acceleration
      (when (boundp 'mouse-wheel-scroll-amount)
        (setq mouse-wheel-scroll-amount '(0.01)))

      ;; TODO: has to be tested
      (define-key global-map [home] 'beginning-of-line)
      (define-key global-map [end] 'end-of-line)

      ;; Customizing the navigation involving the COMMAND key
      (global-set-key (kbd "<s-right>") 'move-end-of-line)
      (global-set-key (kbd "<s-left>") 'move-beginning-of-line)
      (global-set-key (kbd "<s-up>") 'beginning-of-buffer)
      (global-set-key (kbd "<s-prior>") 'beginning-of-buffer)
      (global-set-key (kbd "<s-down>") 'end-of-buffer)
      (global-set-key (kbd "<s-next>") 'end-of-buffer)

      ;; define the function to kill the characters from the cursor
      ;; to the beginning of the current line
      (defun backward-kill-line (arg)
        "Kill chars backward until encountering the end of a line."
        (interactive "p")
        (kill-line 0))
      ;; you may want to bind it to a different key
      (global-set-key (kbd "<s-backspace>") 'backward-kill-line)
      ))

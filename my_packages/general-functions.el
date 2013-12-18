(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

(defun copy-full-path-to-kill-ring ()
  "copy buffer's full path to kill ring"
  (interactive)
  (when buffer-file-name
    (kill-new (file-truename buffer-file-name))))

;; This function sets the selected frame's size
(defun restore-default-frame-size ()
  "Sets or restores the default frame size"
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 85 49)
  )
(if (window-system)
    (restore-default-frame-size))

;; Maximizes the selected frame's size to fit my MacBook pro 13" display
(defun maximize-frame-size ()
  "Maximizes the frame size for usage on my MacBook pro 13'"
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 177 49)
  )

(defun insert-code-tag ()
  "Insert <code> and </code> around word or selected text

You can mark a region or set the point on a word and the function will
wrap the input with the html <code> tag."
  (interactive)
  (let (pos1 pos2 bds len)
    (if (region-active-p)
        (setq pos1 (region-beginning) pos2 (region-end))
      (progn
        (setq bds (bounds-of-thing-at-point 'symbol))
        (setq pos1 (car bds) pos2 (cdr bds))
        )
      )
    ;; now, pos1 and pos2 are the starting and ending positions of the
    ;; current word, or current text selection if exist.
    (setq len (- pos2 pos1))
    (goto-char pos1)
    (insert "<code>")
    (forward-char len)
    ;; (goto-char pos2)
    (insert "</code>")
    )
  )

;; Switch to the minibuffer
;; http://superuser.com/a/132454/57249
(defun switch-to-minibuffer-window ()
  "Switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-window (active-minibuffer-window))))
(global-set-key (kbd "<f5>") 'switch-to-minibuffer-window)

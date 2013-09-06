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

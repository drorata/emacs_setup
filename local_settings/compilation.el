;;;;;;;;;;;;;;;;;;
;; Compilation
;;;;;;;;;;;;;;;;;;
(setq compilation-window-height 8)
(setq compilation-finish-function
      (lambda (buf str)
        (if (string-match "exited abnormally" str)
            ;;there were errors
            (message "compilation errors, press C-x ` to visit")
          ;;no errors, make the compilation window go away in 0.5 seconds
          (run-at-time 0.5 nil 'delete-windows-on buf)
	  (message "NO COMPILATION ERRORS! Thank you dear compiler..."))))

;; Wraps lines in the compilation buffer.
;; http://stackoverflow.com/questions/1292936/line-wrapping-within-emacs-compilation-buffer
(defun my-compilation-mode-hook ()
  (setq truncate-lines nil)
  (setq truncate-partial-width-windows nil))
(add-hook 'compilation-mode-hook 'my-compilation-mode-hook)

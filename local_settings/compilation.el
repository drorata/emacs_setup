;;;;;;;;;;;;;;;;;;
;; Compilation
;;;;;;;;;;;;;;;;;;

(defun bury-compile-buffer-if-successful (buffer string)
  "Bury a compilation buffer if succeeded without warnings "
  (if (and
       (string-match "compilation" (buffer-name buffer))
       (string-match "finished" string)
       (not
        (with-current-buffer buffer
          (search-forward "warning" nil t)))
       )
      (run-with-timer 1 nil
                      (lambda (buf)
                        (switch-to-prev-buffer (get-buffer-window buf) 'kill)
                        (message "NO COMPILATION ERRORS! Thank you dear compiler...")
                        ) buffer)
    (message "compilation errors, press C-x ` to visit")
    ))
(add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)

;; (setq compilation-window-height 8)
;; (setq compilation-finish-function
;;       (lambda (buf str)
;;         (if (string-match "exited abnormally" str)
;;             ;;there were errors
;;             (message "compilation errors, press C-x ` to visit")
;;           ;;no errors
;;           (progn
;;             (if ( < (frame-width) 163)
;;                 ;; make the compilation window go away in 1.5 seconds
;;                 ;; only if the frame width is smaller then 85 chars.
;;                 (run-at-time 1.5 nil 'delete-windows-on buf)
;;               )
;;             (message "NO COMPILATION ERRORS! Thank you dear compiler..."))
;;           ))
;;       )

;; Wraps lines in the compilation buffer.
;; http://stackoverflow.com/questions/1292936/line-wrapping-within-emacs-compilation-buffer
(defun my-compilation-mode-hook ()
  (setq truncate-lines nil)
  (setq truncate-partial-width-windows nil))
(add-hook 'compilation-mode-hook 'my-compilation-mode-hook)

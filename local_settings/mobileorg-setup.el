(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-inbox-for-pull "~/Dropbox/MobileOrg/from-mobile.org")

(defvar org-mobile-push-timer nil
  "Timer that `org-mobile-push-timer' used to reschedule itself, or nil.")

(defun org-mobile-push-with-delay (secs)
  (when org-mobile-push-timer
    (cancel-timer org-mobile-push-timer))
  (setq org-mobile-push-timer
        (run-with-idle-timer
         (* 1 secs) nil 'org-mobile-push)))

(add-hook 'after-save-hook
          (lambda ()
            (when (eq major-mode 'org-mode)
              (dolist (file (org-mobile-files-alist))
                (if (string= (expand-file-name (car file)) (buffer-file-name))
                    (org-mobile-push-with-delay 30)))
              )))

(run-at-time "00:05" 86400 '(lambda () (org-mobile-push-with-delay 1))) ;; refreshes agenda file each day

(org-mobile-pull) ;; run org-mobile-pull at startup

(defun install-monitor (file secs)
  (run-with-timer
   0 secs
   (lambda (f p)
     (unless (< p (second (time-since (elt (file-attributes f) 5))))
       (org-mobile-pull)))
   file secs))

(install-monitor (file-truename
                  (concat
                   (file-name-as-directory org-mobile-directory)
                   org-mobile-capture-file))
                 5)

;; Do a pull every 5 minutes to circumvent problems with timestamping
;; (ie. dropbox bugs)
(run-with-timer 0 (* 5 60) 'org-mobile-pull)

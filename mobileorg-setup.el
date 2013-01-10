;; Source is:
;; http://kenmankoff.com/2012/08/17/emacs-org-mode-and-mobileorg-auto-sync

;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

;; Fork the work (async) of pushing to mobile
;; https://gist.github.com/3111823 ASYNC org mobile push...
(require 'gnus-async)
;; Define a timer variable
(defvar org-mobile-push-timer nil
  "Timer that `org-mobile-push-timer' used to reschedule itself, or nil.")
;; Push to mobile when the idle timer runs out
(defun org-mobile-push-with-delay (secs)
  (when org-mobile-push-timer
    (cancel-timer org-mobile-push-timer))
  (setq org-mobile-push-timer
        (run-with-idle-timer
         (* 1 secs) nil 'org-mobile-push)))
;; After saving files, start an idle timer after which we are going to push
(add-hook 'after-save-hook
          (lambda ()
            (if (or (eq major-mode 'org-mode) (eq major-mode 'org-agenda-mode))
                (dolist (file (org-mobile-files-alist))
                  (if (string= (expand-file-name (car file)) (buffer-file-name))
                      (org-mobile-push-with-delay 10)))
              )))
;; Run after midnight each day (or each morning upon wakeup?).
(run-at-time "00:01" 86400 '(lambda () (org-mobile-push-with-delay 1)))
;; Run 1 minute after launch, and once a day after that.
(run-at-time "1 min" 86400 '(lambda () (org-mobile-push-with-delay 1)))


;; watch mobileorg.org for changes, and then call org-mobile-pull
;; http://stackoverflow.com/questions/3456782/emacs-lisp-how-to-monitor-changes-of-a-file-directory
(defun install-monitor (file secs)
  (run-with-timer
   0 secs
   (lambda (f p)
     (unless (< p (second (time-since (elt (file-attributes f) 5))))
       (org-mobile-pull)))
   file secs))
(defvar monitor-timer (install-monitor (concat org-mobile-directory "/mobileorg.org") 30)
  "Check if file changed every 30 s.")

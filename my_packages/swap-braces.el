;;; swap-braces.el - a minor mode to swap square and curly braces

;;; Installation:

;; Drop it in your load path and (require 'swap-braces).
;; Possibly also (add-hook 'foo-mode-hook 'swap-braces-mode).

;;; Commentary:

;; The swap function explicitly instructs Linum to schedule an update,
;; if Linum mode is enabled; otherwise, Linum does not automatically
;; update while Swap-Braces mode is enabled.
;; This seems like it should not be necessary, and I'm uncertain whether
;; it has greater implications regarding interaction between this mode
;; and others.
;; (That is, it makes me worry that something about how I've implemented
;; this makes it screw up other modes using post-command-hook. Caveat user!)
;;
;; Inspired by a question in SuperUser: http://superuser.com/q/634564/57249

;;; Author

;; Aaron Miller (me@aaron-miller.me)

(setq swap-braces-map (make-sparse-keymap))

(define-key swap-braces-map (kbd "{") "[")
(define-key swap-braces-map (kbd "}") "]")
(define-key swap-braces-map (kbd "[") "{")
(define-key swap-braces-map (kbd "]") "}")

(define-minor-mode swap-braces-mode
  "When active, swap square braces and curly braces, so that e.g. pressing [
elicits '{', and S-[ elicits '['.

The keymap `swap-braces-map' defines this mode's behavior. It is strongly
recommended that you do not define keys in this map which are not self-
inserting characters; the resulting behavior is indeterminate, but almost
certainly not what you intended."
  :init-value nil
  :lighter " [{"
  (if swap-braces-mode
      (add-hook 'post-command-hook
                'swap-braces-mode-swap)
    (remove-hook 'post-command-hook
                 'swap-braces-mode-swap)))

(defun swap-braces-mode-swap ()
  ;; this worries me
  (if (and (boundp 'linum-mode)
           (not (eq nil linum-mode)))
      (linum-schedule))
  (when (and (eq (char-before) last-command-event))
    (let* ((translation (lookup-key swap-braces-map (string (char-before)))))
      (if (stringp translation)
          (progn
            (backward-delete-char 1)
            (insert translation))))))

(provide 'swap-braces)

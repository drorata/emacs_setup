;;-----------------------------
;; ido mode
;; setting for ido mode
;; Interactive do, find-file and iswitchb replacement with fuzzy/flex matching.
;;-----------------------------
(require 'ido)
(ido-mode t)

(setq
 ido-save-directory-list-file "~/.emacs.d/cache/ido.last"
 ido-case-fold  t   ;; Not case-insensitive
 ido-confirm-unique-completion t     ;; wait for RET, even with unique completion
 ido-create-new-buffer 'always
 ido-enable-flex-matching t          ;; Must have!
 ido-enable-last-directory-history t ;; remember last used dirs
 ido-max-work-directory-list 30      ;; should be enough
 ido-max-work-file-list 50           ;; remember many
 ido-use-filename-at-point nil       ;; don't use filename at point
 ido-use-url-at-point nil            ;; don't use url at point
 ido-enable-prefix nil
 ido-max-prospects 12)

;; Set the background to gray
;; (setq default-frame-alist
;;       (append default-frame-alist
;;               '((foreground-color . "Black")
;;                 (background-color . "#DEDEDE")
;;                 (cursor-color . "Black")
;;                 )))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme `dark-emacs)

;; (load-theme 'tsdh-dark)

;; Custom the faces of diffs in vc-diff mode
(custom-set-faces
 '(diff-added ((t (:foreground "dark green"))) 'now)
 '(diff-removed ((t (:foreground "red"))) 'now)
 ;; ido colors settings
 ;; Face used by ido for highlighting subdirs in the alternatives.
 '(ido-subdir ((t (:foreground "#0084F0"))))
 ;; Face used by ido for highlighting first match.
 '(ido-first-match ((t (:foreground "red"))))
 ;; Face used by ido for highlighting only match.
 '(ido-only-match ((t (:foreground "green"))))
 ;; Face used by ido for highlighting its indicators (don't actually use this)
 ;; '(ido-indicator ((t (:foreground "#ffffff"))))
 ;; Ido face for indicating incomplete regexps. (don't use this either)
 ;; '(ido-incomplete-regexp ((t (:foreground "#ffffff"))))
 )

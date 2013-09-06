;; Set the background to gray
(setq default-frame-alist
      (append default-frame-alist
              '((foreground-color . "Black")
                (background-color . "#DEDEDE")
                (cursor-color . "Black")
                )))

;; (load-theme 'tsdh-dark)

;; Custom the faces of diffs in vc-diff mode
(custom-set-faces
 '(diff-added ((t (:foreground "dark green"))) 'now)
 '(diff-removed ((t (:foreground "red"))) 'now)
 )

;; ido colors settings
(custom-set-faces
 ;; Face used by ido for highlighting subdirs in the alternatives.
 '(ido-subdir ((t (:foreground "blue"))))
 ;; Face used by ido for highlighting first match.
 '(ido-first-match ((t (:foreground "red"))))
 ;; Face used by ido for highlighting only match.
 '(ido-only-match ((t (:foreground "darkgreen"))))
 ;; Face used by ido for highlighting its indicators (don't actually use this)
 ;; '(ido-indicator ((t (:foreground "#ffffff"))))
 ;; Ido face for indicating incomplete regexps. (don't use this either)
 ;; '(ido-incomplete-regexp ((t (:foreground "#ffffff"))))
 )

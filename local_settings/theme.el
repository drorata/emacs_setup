;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (load-theme `dark-emacs t)
;; (load-theme 'tsdh-dark)

;; Set the background to gray
(setq default-frame-alist
(append default-frame-alist
        '(
          (foreground-color . "black")
          (background-color . "#DEDEDE")
          (cursor-color . "black")
          )
        ))

(custom-set-faces
 ;; vc-colors
 '(diff-added ((t (:foreground "darkgreen"))) 'now)
 '(diff-removed ((t (:foreground "red"))) 'now)
 ;; ido colors settings
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

;; change magit diff colors
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "darkgreen")
     (set-face-foreground 'magit-diff-del "red")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))

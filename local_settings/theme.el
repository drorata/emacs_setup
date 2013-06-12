;; Set the background to gray
(setq default-frame-alist
      (append default-frame-alist
              '((foreground-color . "Black")
                (background-color . "#DEDEDE")
                (cursor-color . "Black")
                )))

;; Custom the faces of diffs in vc-diff mode
(custom-set-faces
 '(diff-added ((t (:foreground "dark green"))) 'now)
 '(diff-removed ((t (:foreground "red"))) 'now)
 )

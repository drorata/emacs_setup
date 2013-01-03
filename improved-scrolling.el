;; ;; scroll one line at a time (less "jumpy" than defaults)

;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; (setq scroll-step 1) ;; keyboard scroll one line at a time

;; Autosave every 500 typed characters
(setq auto-save-interval 500)
;; Scroll just one line when hitting bottom of window
(setq scroll-conservatively 10000)

;;(require 'smooth-scroll)
;;(smooth-scroll-mode t)

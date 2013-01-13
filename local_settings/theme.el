;;; Theme customization
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/zenburn")
;; (load-theme 'zenburn t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/tangotango")
(load-theme 'tangotango t)
;; Fix the font that are changed by the theme
(when (eq system-type 'darwin)
  ;; default Latin font (e.g. Consolas)
  ;; default font size (point * 10)
  (set-face-attribute 'default nil :family "Monaco" :height 120 :weight 'normal))


;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/ir-black")
;; (load-theme 'ir-black t)

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized")
;; (load-theme 'solarized-light t)

;; (load-theme 'tango-dark)

;; ;; Setting Colors for various additional elements
;; (defface hl-line '((t (:background "white")))
;;   "Face to use for `hl-line-face'." :group 'hl-line)
;; (setq hl-line-face 'hl-line)
;; (global-hl-line-mode t)
;; ;;(set-face-background 'hl-line-face "gray")
;; (set-face-background 'show-paren-match-face "yellow")
;; (set-face-background 'region "#e84687")
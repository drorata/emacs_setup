;;; Theme customization

;;(load-theme 'wombat)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/zenburn")
(load-theme 'zenburn t)

;; Setting Colors for various additional elements
(set-face-background 'hl-line-face "gray15")
(set-face-background 'show-paren-match-face "yellow10")
(set-face-background 'region "blue")

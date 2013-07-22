;; Set the right aspell.
;; You have to install aspell - I did it using macports:
;; 1. port install aspellen
;; 2. sudo port install aspell-english
(setq ispell-program-name "/opt/local/bin/aspell")

;; Enable the mouse with flyspell.
(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [(mouse-1)] #'flyspell-correct-word)))

;; Enable flyspell-prog-mode which checks spelling in comments of code
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)

;; Enable flyspell for certain modes.
(add-hook 'text-mode-hook 'turn-on-flyspell)

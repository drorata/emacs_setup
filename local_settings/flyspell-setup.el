;; Set the right aspell.
;; You have to install aspell - I did it using macports:
;; 1. port install aspellen
;; 2. sudo port install aspell-english
(setq ispell-program-name "/opt/local/bin/aspell")

;; Enable the mouse with flyspell.
(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [(mouse-1)] #'flyspell-correct-word)))

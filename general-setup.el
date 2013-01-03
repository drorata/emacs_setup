(setq load-path (cons "~/Library/elisp" load-path))

;; Set the right aspell.
;; You have to install aspell - I did it using macports:
;; 1. port install aspellen
;; 2. sudo port install aspell-english
(setq ispell-program-name "/opt/local/bin/aspell")

;; Highlight current line
(global-hl-line-mode t) ; turn it on for all modes by default

;; Prevent beeping on warnings
(setq visible-bell t)

;; Delete trailing white spaces before saving
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Revert to changes on disk automatically
(global-auto-revert-mode t)

;;---------------------------------------------------
;; Matching braces highlighting
;; Enables and configure mathcing braces highlighting
;;---------------------------------------------------
(show-paren-mode t)
(setq show-paren-style 'expression)
;; Show in the mini-buffer the matching brace in case it is off screen.
(defadvice show-paren-function
  (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
        echo area. Has no effect if the character before point is not of
        the syntax class ')'."
  (interactive)
  (if (not (minibuffer-prompt))
      (let ((matching-text nil))
	;; Only call `blink-matching-open' if the character before point
	;; is a close parentheses type character. Otherwise, there's not
	;; really any point, and `blink-matching-open' would just echo
	;; "Mismatched parentheses", which gets really annoying.
	(if (char-equal (char-syntax (char-before (point))) ?\))
	    (setq matching-text (blink-matching-open)))
	(if (not (null matching-text))
	    (message matching-text)))))

;; Auto Pairing http://www.emacswiki.org/emacs/AutoPairs
(require 'autopair)

;; Auto indent for paseted text
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
	   (and (not current-prefix-arg)
		(member major-mode '(emacs-lisp-mode lisp-mode
						     clojure-mode    scheme-mode
						     haskell-mode    ruby-mode
						     rspec-mode      python-mode
						     c-mode          c++-mode
						     objc-mode       latex-mode
						     plain-tex-mode))
		(let ((mark-even-if-inactive transient-mark-mode))
		  (indent-region (region-beginning) (region-end) nil))))))

;; Make cursor block
(set-default 'cursor-type 'box)
(blink-cursor-mode -1)

;; Enable server
(server-start)

(setq load-path (cons "~/Library/elisp" load-path))

;; Highlight current line
(setq hl-line-face 'hl-line)
(global-hl-line-mode t) ; turn it on for all modes by default
(set-face-background hl-line-face "gray25")

;; Prevent beeping on warnings
(setq visible-bell t)

;; Delete trailing white spaces before saving
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

(setq tramp-default-method "ssh")
(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

;; Set behavior of END HOME keys
;; --- the following came from:
;; http://www.popcornfarmer.com/2008/04/mac-home-and-end-keys/
(if (boundp 'osx-key-mode-map)
    (setq hah-key-map osx-key-mode-map)
  (setq hah-key-map global-map))
(define-key hah-key-map [home] 'beginning-of-line)
(define-key hah-key-map [end] 'end-of-line)
(define-key hah-key-map [C-home] 'beginning-of-buffer)
(define-key hah-key-map [C-end] 'end-of-buffer)

;; Open files by pointing at them
(global-set-key (kbd "C-x f") 'find-file-at-point)

;; Revert to changes on disk automatically
(global-auto-revert-mode t)

;;;;;;;;;;;
;; Enables and configure mathcing braces highlighting
(show-paren-mode t)
(set-face-background 'show-paren-match-face "#3580B0")
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

(load "improved-scrolling")

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

;; Enable dot-language mode
(load-file "~/Library/elisp/graphviz-dot-mode.el")

;; Add CMAKE support
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))

;; Enable ido mode
;;; Interactive do, find-file and iswitchb replacement with fuzzy/flex matching.
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq ido-enable-last-directory-history nil) ; forget latest selected directory names

(custom-set-faces
 '(ido-subdir ((t (:foreground "#D991CE")))) ;; Face used by ido for highlighting subdirs in the alternatives.
;; '(ido-first-match ((t (:foreground "#ccff66")))) ;; Face used by ido for highlighting first match.
;; '(ido-only-match ((t (:foreground "#ffcc33")))) ;; Face used by ido for highlighting only match.
;; '(ido-indicator ((t (:foreground "#ffffff")))) ;; Face used by ido for highlighting its indicators (don't actually use this)
;; '(ido-incomplete-regexp ((t (:foreground "#ffffff")))) ;; Ido face for indicating incomplete regexps. (don't use this either)
)


;; Enable server
(server-start)
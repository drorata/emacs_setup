;; Recursive loading of paths in the .emacs.d directory
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Disable welcome/startup screen/message
(setq inhibit-startup-message t)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight current line
(global-hl-line-mode t) ; turn it on for all modes by default

;; Enables overwriting a selected text
(delete-selection-mode t)

;; Line/column number modes
(setq line-number-mode t)
(setq column-number-mode t)

;; Prevent beeping on warnings
(setq visible-bell t)

;; Delete trailing white spaces before saving
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Revert to changes on disk automatically
(global-auto-revert-mode t)

;; ;; Add external packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

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

;; Opening files
;; Visits files in existing frames
(setq ns-pop-up-frames nil)
;; In addition I added the following script named /usr/bin/emacs:
;; ------
;; #!/bin/sh
;; open -a /Applications/Emacs.app/Contents/MacOS/Emacs $*
;; ------
;; and made it executable. This way I can open new files directly from
;; the command line with no new frames which pop up! For the sake of fun I added
;; ------
;; alias em='open -a /Applications/Emacs.app $1'
;; ------
;; to my .bashrc


;; Customize the frame's title
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Use default mac mailer for emails
;; TODO: run these only when using mac OS X
(setq browse-url-mailto-function 'browse-url-generic)
(setq browse-url-generic-program "open")

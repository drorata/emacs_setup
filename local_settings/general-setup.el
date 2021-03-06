(package-initialize)
;; Recursive loading of paths in the .emacs.d directory
(let ((default-directory "~/.emacs.d/elpa"))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/my_packages/")

;; Disable welcome/startup screen/message
(setq inhibit-startup-message t)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable downcase-region
(put 'downcase-region 'disabled nil)

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
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; Set a directory for image thumbnails
(setq image-dired-dir "~/.emacs.d/cache/image-dired/")
;; Where to store cookies
(setq url-configuration-directory "~/.emacs.d/cache/url")

(show-paren-mode 1)
(setq show-paren-style 'expression)
;; ;;---------------------------------------------------
;; ;; Matching braces highlighting - Using mic-paren
;; ;; Enables and configure mathcing braces highlighting
;; ;; http://superuser.com/a/305041/57249
;; ;; http://emacs.stackexchange.com/q/5569/861
;; ;;---------------------------------------------------
;; (paren-activate) ;; activates mic-paren
;; (setq paren-match-face 'highlight)
;; (setq paren-sexp-mode t)
;; (setq paren-highlight-offscreen t)
;; ;; Disable mic-paren in minibuffer
;; (defun da/remove-mic-paren-face-in-minibuffer ()
;;   ;; Check if we are in ido related command
;;   (when (string-match-p "ido-" (symbol-name this-command))
;;     (set (make-variable-buffer-local 'paren-match-face) nil)))
;; (add-hook 'minibuffer-setup-hook #'da/remove-mic-paren-face-in-minibuffer)

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
(if (eq system-type 'darwin)
    (progn
      (setq browse-url-mailto-function 'browse-url-generic)
      (setq browse-url-generic-program "open")
      )
  )

(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves-emacs"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

;; Assign modes to file types
(add-to-list 'auto-mode-alist '("\\.plist\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.tikz\\'" . latex-mode))
(add-to-list 'auto-mode-alist '("\\.pgfplot\\'" . latex-mode))
(add-to-list 'auto-mode-alist
             '("\\(stack\\(exchange\\|overflow\\)\\|superuser\\|askubuntu\\)\\.com\\.[a-z0-9]+\\.txt" . markdown-mode)
             )

;; Installed from elpa.
;; See appearance.el for face customization
(require 'anzu)
(global-anzu-mode t)

;;
;; Set the emacs path to the bash one. This solves the problem
;; that org cannot export to PDF on OS X 10.9+.
;; See: http://emacs.stackexchange.com/a/4093/861
(defun set-exec-path-from-shell-PATH ()
  "Sets the exec-path to the same value used by the user shell"
  (let ((path-from-shell
         (replace-regexp-in-string
          "[[:space:]\n]*$" ""
          (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;; call function now
(set-exec-path-from-shell-PATH)

;; Set python virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "~/py-envs/")

;; Encoding setting
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")

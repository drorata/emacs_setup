;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LaTeX Related
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; General Setting
;;
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil) ; Master file support

;;
;; Adds environments to the C-c C-e
;;
;; http://superuser.com/questions/122410/adding-autocomplete-options-to-auctex-c-c-c-e
;; See: http://www.gnu.org/software/auctex/manual/auctex/Adding-Environments.html#Adding-Environments
;; for further details
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (LaTeX-add-environments
             '("tikzpicture")
             '("scope")
             '("align" LaTeX-env-label)
             '("align*")
             '("aligned" LaTeX-env-label)
             '("theorem" LaTeX-env-label)
             '("lemma" LaTeX-env-label)
             '("corollary" LaTeX-env-label)
             '("proof")
             '("remark" LaTeX-env-label)
             '("claim" LaTeX-env-label)
             '("definition" LaTeX-env-label)
             )
            )
          )

;; This part should bind C-0 to the following seuqence:
;; 1. Save the master file and all depending ones
;; 2. run latemk
;; 3. show errors if there are.
;; check the following links:
;; http://stackoverflow.com/questions/7885853/emacs-latexmk-function-throws-me-into-an-empty-buffer
;; http://stackoverflow.com/questions/7587287/how-do-i-bind-latexmk-to-one-key-in-emacs-and-have-it-show-errors-if-there-are-a
;; (require 'tex-buf) ; Seems not to be needed. I removed to enable standard emacs
(defun run-latexmk ()
  (interactive)
  (let ((TeX-save-query nil)
        (TeX-process-asynchronous nil)
        (master-file (TeX-master-file)))
    (TeX-save-document "")
    (TeX-run-TeX "latexmk"
		 (TeX-command-expand "latexmk -pdf %t" 'TeX-master-file)
		 master-file)
    (if (plist-get TeX-error-report-switches (intern master-file))
        (TeX-next-error t)
      (minibuffer-message "latexmk done"))))
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "C-0") #'run-latexmk)))

;; 2FIX
;; (require 'auctex-latexmk)
;; (auctex-latexmk-setup)

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list '("Make" "make" TeX-run-command nil t)))

(add-hook 'LaTeX-mode-hook
          (lambda () (setq TeX-command-default "Make")
            ))

;; Enable outline-mode in LaTeX-mode
(defun turn-on-outline-minor-mode ()
  (outline-minor-mode 1))
(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c\C-o") ; Or something else
;; Automatically activate TeX-fold-mode.
;; http://tex.stackexchange.com/questions/52179/what-is-your-favorite-emacs-and-or-auctex-command-trick
(add-hook 'TeX-mode-hook
	  (lambda () (TeX-fold-mode 1)))

;;
;; Set additional fontifications of macros
;;
;; http://tex.stackexchange.com/questions/50827/a-simpletons-guide-to-tex-workflow-with-emacs
(setq font-latex-match-reference-keywords
      '(("cref" "*[{")
        ("Cref" "*[{")
        ("todo" "[{")
        ("includegraphics" "[{")
        ("citeauthor" "[{")))

;;
;; Enable emacs->skim sync
;;
;; For this to work, TeX-PDF-mode should be enabled!
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))
;; COMMAND-SHIFT-CLICK to jump to the location in the PDF
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "<S-s-mouse-1>") #'TeX-view))
          )

;; Key bindings in TeX-mode
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "C-c C-v") 'magit-status)))
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "C-c v") 'TeX-view)))
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (local-set-key (kbd "M-RET") 'LaTeX-insert-item)))

;; " expands into csquotes macros
(setq LaTeX-csquotes-close-quote "}"
      LaTeX-csquotes-open-quote "\\enquote{")

;;
;; RefTeX related
;;
;; Enable refTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; Disable initial prompt for style
(setq reftex-ref-macro-prompt nil)

;; Enable clevref in tex-mode
(defun reftex-format-cref (label def-fmt)
  (format "\\cref{%s}" label))

(eval-after-load
    "latex"
  '(TeX-add-style-hook
    "cleveref"
    (lambda ()
      (if (boundp 'reftex-ref-style-alist)
          (add-to-list
           'reftex-ref-style-alist
           '("Cleveref" "cleveref"
             (("\\cref" ?c) ("\\Cref" ?C) ("\\cpageref" ?d) ("\\Cpageref" ?D)))))
      (add-to-list 'reftex-ref-style-default-list "Cleveref")
      (TeX-add-symbols
       '("cref" TeX-arg-ref)
       '("Cref" TeX-arg-ref)
       '("cpageref" TeX-arg-ref)
       '("Cpageref" TeX-arg-ref)))))

;; So that RefTeX recognizes bibliographies in \addbibresource
(setq reftex-bibliography-commands (quote ("addbibresource")))

(setq reftex-label-alist
      '(
        ("claim" ?h "th:" nil t)
        ("theorem" ?h "th:" nil t)
        ("lemma" ?h "th:" nil t)
        ("corollary" ?h "th:" nil t)
        ("proposition" ?h "th:" nil t)
        ("condition" ?h "cond:" nil t)
        ("definition" ?d "def:" nil t)
        ("remark" ?r "rmrk:" nil t)
        )
      )
;; RefTex - end

;;
;; Hooks
;;
;; Line breaking and visualizing
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; Enable yas in LaTeX mode
(add-hook 'LaTeX-mode-hook 'yas-minor-mode)
;; Enable LaTeX-math-mode by default
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; Auto enable flyspell-mode
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)

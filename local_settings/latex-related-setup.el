;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LaTeX Related
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil) ; Master file support

;;;;;
;; This is still on going setting.. Find how to work nicely with hard line
;; breaks.
;;;;;
;; Line breaking and visualizing
(add-hook 'LaTeX-mode-hook 'visual-line-mode)

;; Enable refTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; Enable LaTeX-math-mode by default
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; Auto enable flyspell-mode
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)
(setq flyspell-auto-correct-binding (kbd "C-~")) ; or a binding of your choice

;; Enable clevref in tex-mode
(defun reftex-format-cref (label def-fmt)
  (format "\\cref{%s}" label))
(setq reftex-format-ref-function 'reftex-format-cref)

;; So that RefTeX recognizes bibliographies in \addbibresource
;; (setq reftex-bibliography-commands (quote ("addbibresource")))

(setq reftex-label-alist
      '(
        ("claim" ?h "th:" nil t)
        ("theorem" ?h "th:" nil t)
        ("lemma" ?h "th:" nil t)
        ("corollary" ?h "th:" nil t)
        ("condition" ?h "cond:" nil t)
        ("definition" ?d "def:" nil t)
        ("remark" ?r "rmrk:" nil t)
        )
      )

;; Adds environments to the C-c C-e
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

;; Enable outline-mode in LaTeX-mode
(defun turn-on-outline-minor-mode ()
  (outline-minor-mode 1))
(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c\C-o") ; Or something else

;; Add support of latexmk
;; First add the texbin to the path
(setenv "PATH"
        (concat
         "/usr/texbin" ":"
         (getenv "PATH")))
;; Config the TeX-command-list
(add-hook 'LaTeX-mode-hook (lambda ()
                             (push
                              '("Latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
                                :help "Run Latexmk on file")
                              TeX-command-list)))

'("%(-PDF)"
  (lambda ()
    (if (and (not TeX-Omega-mode)
             (or TeX-PDF-mode TeX-DVI-via-PDFTeX))
        "-pdf" "")))

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
          (lambda () (local-set-key (kbd "C-0") #'run-latexmk))
          )

;; Automatically activate TeX-fold-mode.
;; http://tex.stackexchange.com/questions/52179/what-is-your-favorite-emacs-and-or-auctex-command-trick
(add-hook 'TeX-mode-hook
	  (lambda () (TeX-fold-mode 1)))

;;
;; Set additional fontifications of macros
;; http://tex.stackexchange.com/questions/50827/a-simpletons-guide-to-tex-workflow-with-emacs
(setq font-latex-match-reference-keywords
      '(("cref" "*[{")
        ("Cref" "*[{")
        ("todo" "[{")
        ("includegraphics" "[{"))
)

;;;;;
;; Enable emacs->skim sync
;; For this to work, TeX-PDF-mode should be enabled!
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))
;; COMMAND-SHIFT-CLICK to jump to the location in the PDF
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "<S-s-mouse-1>") #'TeX-view))
          )

;; Key bindings in TeX-mode
;; (add-hook 'TeX-mode-hook (lambda () (define-key TeX-mode-map "<M-tab>" 'TeX-complete-macro)))
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (local-set-key (kbd "M-RET") 'LaTeX-insert-item)
            )
          )

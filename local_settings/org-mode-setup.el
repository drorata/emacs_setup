;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Mode related
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-directory "~/Dropbox/org")

;; Set a location for the list of agena files
(setq org-agenda-files "~/.emacs.d/agenda_files")

;; Assigns org-mode to .org files
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(when window-system (require 'org-mouse))

;; Auto enable flyspell-mode
(add-hook 'org-mode-hook 'turn-on-flyspell)

;; Auto fill minor mode in org files
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Enable org-indent-mode for org buffers
(add-hook 'org-mode-hook
          (lambda ()(org-indent-mode t)) t)

;; Use text-mode abbrev table in org-mode
(add-hook 'org-mode-hook '(lambda () (setq local-abbrev-table text-mode-abbrev-table)))

;; Enables selection using SHIFT, while maintaining useful actions
;; related to SHITF in org
(setq org-support-shift-select 't)

;; Enable smart qoutes (http://stackoverflow.com/q/15097114/671013)
(setq org-export-with-smart-quotes t)

;; Customize the TODO-like keywords
(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "PROCESS(p@/!)" "|" "DONE(d!)" "CANCELED(c@/!)")))
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("PROCESS" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold))))
(setq org-log-into-drawer t)

;; Capture-org
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      (quote (("t" "todo" entry (file (concat org-directory "/gtd.org"))
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("n" "note" entry (file (concat org-directory "/gtd.org"))
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree (concat org-directory "/diary.org"))
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("v" "Vocabulary" entry
               (file+headline (concat org-directory "/vocab.org")
                              "Vocabulary")
               "* %^{The word} :drill:\n:PROPERTIES:\n:Part-of-speech: %^{Part of speech|verb|noun|adj|adv}\n:END:\n %t\n %^{Extended word (may be empty)} \n** Answer \n%^{The definition}")
              )))

;; Make use of refTeX in org-mode
(defun org-mode-reftex-setup ()
  "Setups RefTeX to be used with a org file. Code is based on http://www.mfasold.net/blog/2009/02/using-emacs-org-mode-to-draft-papers/.

Once you run this, you will be asked to set a master file of the org."
  (interactive)
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  )

;; Open indirect buffer in new frame
(setq org-indirect-buffer-display 'new-frame)

;; Set common TAGS
;; Check: http://sachachua.com/blog/2008/01/tagging-in-org-plus-bonus-code-for-timeclocks-and-tags/
(setq org-tag-alist '(
                      ("PRIVATE" . ?p)
                      (:startgroup . nil)
                      ("WORK" .?w)
                      (:grouptags . nil)
                      ("WORK@mittagseminar" . ?m)
                      ("WORK@open_questions" . ?i)
                      ("WORK@diss" . ?d)
                      ("WORK@CV" . nil)
                      (:endgroup . nil)
                      (:startgroup . nil)
                      ("IT" . ?I)
                      (:grouptags . nil)
                      ("IT@emacs" . nil)
                      ("IT@git" . nil)
                      ("IT@TeX" . nil)
                      (:endgroup . nil)
                      (:startgroup . nil)
                      ("PROG" . ?p)
                      (:grouptags . nil)
                      ("PROG@mathematica" . nil)
                      ("PROG@cgal" . nil)
                      (:endgroup . nil)
                      (:endgroup . nil)
                      ("4freeTime" . ?4)
                      ))

;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

;; Add time stamp of refiling
(setq org-log-refile 'time)

;; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

;; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))

;; set latexmk the default LaTeX compiler for org-mode and in general
(setq org-latex-to-pdf-process (list "latexmk -f -pdf %f"))

;; Enable clocking across sessions
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Set the number of clock items before wrapping them in a LOGBOOK drawer
(setq org-clock-into-drawer '2)

;; Set the number of clock items before wrapping them in a LOGBOOK drawer
(setq org-clock-into-drawer '2)

;; MobileOrg
(load "mobileorg-setup")

;; Org drill
(require 'org-drill)
(setq org-drill-save-buffers-after-drill-sessions-p nil)
(setq org-drill-scope 'file-no-restriction)

;; org2blog
(require 'metaweblog)
(require 'org2blog-autoloads)

(setq org2blog/wp-blog-alist
            '(("drorata"
      	 :url "http://drorata.wordpress.com/xmlrpc.php"
      	 :username "drorata")
      	("TeX.SE-Blog"
      	 :url "http://tex.blogoverflow.com/xmlrpc.php"
      	 :username "droratariah")
      	)
            )

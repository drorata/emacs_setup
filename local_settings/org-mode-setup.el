;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Mode related
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-directory "~/Dropbox/org")

;; Set a location for the list of agena files
(setq org-agenda-files "~/.emacs.d/agenda_files")

;; Assigns org-mode to .org files
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Auto enable flyspell-mode
(add-hook 'org-mode-hook 'turn-on-flyspell)

;; Auto fill minor mode in org files
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Enable org-indent-mode for org buffers
(add-hook 'org-mode-hook
          (lambda ()(org-indent-mode t)) t)

;; Use text-mode abbrev table in org-mode
(add-hook 'org-mode-hook '(lambda () (setq local-abbrev-table text-mode-abbrev-table)))

;; Set the number of clock items before wrapping them in a LOGBOOK drawer
(setq org-clock-into-drawer '2)

;; Enables selection using SHIFT, while maintaining useful actions
;; related to SHITF in org
(setq org-support-shift-select 't)

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
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  )
(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; Open indirect buffer in new frame
(setq org-indirect-buffer-display 'new-frame)

;; Set common TAGS
;; Check: http://sachachua.com/blog/2008/01/tagging-in-org-plus-bonus-code-for-timeclocks-and-tags/
(setq org-tag-alist '(
                      ("interesting_questions" . ?i)
                      ("mittagseminar" . ?m)
                      ("private" . ?p)
                      ("work" .?w)
                      ("emacs" .?e)
                      ("IT" .?I)
                      ("cspace_parameetr" . ?c)
                      ("opt_quad_surf_approx" . ?o)
                      ("cgal_dev" . ?g)
                      ))

;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

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

;; MobileOrg
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-inbox-for-pull "~/Dropbox/MobileOrg/from-mobile.org")


;; Org drill
(require 'org-drill)

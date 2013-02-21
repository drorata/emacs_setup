;; This starts the edit-server which is used to edit text areas in Chrome.
;; See: http://psung.blogspot.de/2010/01/edit-with-emacs-chrome-extension.html?m=1
;; See: http://stackoverflow.com/q/10383986/671013
;; See: http://www.emacswiki.org/emacs/Edit_with_Emacs

(require 'edit-server)
(edit-server-start)

(add-hook 'edit-server-start-hook 'markdown-mode)

(add-hook 'edit-server-done-hook
          (lambda () (kill-ring-save (point-min) (point-max)))
          )

(add-to-list 'load-path (expand-file-name "/Applications/Sage-5.7-OSX-64bit-10.6.app/Contents/Resources/sage/local/share/emacs/"))
(require 'sage "sage")
(setq sage-command "/Applications/Sage-5.7-OSX-64bit-10.6.app/Contents/Resources/sage/sage")

;; If you want sage-view to typeset all your output and have plot()
;; commands inline, uncomment the following line and configure sage-view:
;; (require 'sage-view "sage-view")
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view)
;; You can use commands like
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view-disable-inline-output)
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view-disable-inline-plots)
;; to enable some combination of features

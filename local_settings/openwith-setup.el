(require 'openwith)
(setq openwith-associations '(
                              ;; ("\\.pdf\\'" "/Applications/Skim.app/Contents/MacOS/Skim" (file))
                              ("\\.pdf\\'" "open" (file))
                              ))
(openwith-mode t)

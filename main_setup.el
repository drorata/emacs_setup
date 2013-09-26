(setq load-path (cons "~/.emacs.d/local_settings" load-path))
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)


(load "general-setup")
(load "general-functions")
(load "bindings")
(load "flyspell-setup")
(load "ido-setup")
(load "mac-friend")
(load "clock-setup")
(load "improved-scrolling")
(load "tramp-setup")
(load "ibuffer-setup")
;; TODO: has to be tested!
(load "tabs-setup")
(load "compilation")
(load "git-setup")
(load "cxx-setup")
(load "gnuplot-setup")
(load "yas-setup")
(load "org-mode-setup")
(load "latex-related-setup")
(load "ack-setup")
(load "cmake-setup")
(load "backup-setup")
(load "openwith-setup")
(load "dictionary-setup")
(load "dired_setup")
(load "edit-server-setup")
(load "sage-setup")
(load "html-setup")
(load "appearance")

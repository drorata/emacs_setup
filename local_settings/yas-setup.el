;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YetAnotherSnippet
;; http://code.google.com/p/yasnippet/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Init:
(add-to-list 'load-path
	     "~/Library/elisp/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

(yas/initialize)

(setq yas/triggers-in-field t); Enable nested triggering of snippets
;; Develop and keep personal snippets
(setq yas/root-directory "~/.emacs.d/packages/yas-snippets")
;; Load the snippets
(yas/load-directory yas/root-directory)

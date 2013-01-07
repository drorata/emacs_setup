;; This uses the dict.el code written by Evan Sultanik, which can be found:
;; http://wiki.sultanik.com/Dictionary_and_thesaurus_lookup_in_Emacs
;; In addition, note that this code needs "dict" to be installed; I did it
;; using macports

(load "dict")
(global-set-key (quote [f7]) 'thesaurus-lookup-word-in-text)
(global-set-key (quote [f8]) 'dictionary-lookup-word-in-text)

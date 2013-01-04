;;-----------------------------
;; ido mode
;; setting for ido mode
;; Interactive do, find-file and iswitchb replacement with fuzzy/flex matching.
;;-----------------------------
(require 'ido)
(ido-mode t)
;; fuzzy matching is a must have
(setq ido-enable-flex-matching t)
;; forget latest selected directory names
(setq ido-enable-last-directory-history nil)

;; (custom-set-faces
;;  ;; Face used by ido for highlighting subdirs in the alternatives.
;;  '(ido-subdir ((t (:foreground "blue"))))
;;  ;; Face used by ido for highlighting first match.
;;  '(ido-first-match ((t (:foreground "red"))))
;;  ;; Face used by ido for highlighting only match.
;;  '(ido-only-match ((t (:foreground "darkgreen"))))
;;  ;; Face used by ido for highlighting its indicators (don't actually use this)
;;  ;; '(ido-indicator ((t (:foreground "#ffffff"))))
;;  ;; Ido face for indicating incomplete regexps. (don't use this either)
;;  ;; '(ido-incomplete-regexp ((t (:foreground "#ffffff"))))
;; )

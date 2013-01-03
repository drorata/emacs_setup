;;-----------------------------
;; ido mode
;; setting for ido mode
;; Interactive do, find-file and iswitchb replacement with fuzzy/flex matching.
;;-----------------------------
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq ido-enable-last-directory-history nil) ; forget latest selected directory names

;; The zenbrun seems to habdle this correctly.
(custom-set-faces
 '(ido-subdir ((t (:foreground "#D991CE")))) ;; Face used by ido for highlighting subdirs in the alternatives.
 '(ido-first-match ((t (:foreground "#ccff66")))) ;; Face used by ido for highlighting first match.
 '(ido-only-match ((t (:foreground "#ffcc33")))) ;; Face used by ido for highlighting only match.
 ;; '(ido-indicator ((t (:foreground "#ffffff")))) ;; Face used by ido for highlighting its indicators (don't actually use this)
 ;; '(ido-incomplete-regexp ((t (:foreground "#ffffff")))) ;; Ido face for indicating incomplete regexps. (don't use this either)
)

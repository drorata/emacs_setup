;; Should file pairs of word-definitions in a designated file using org-mode.
;; - The top-level headings are A-Z
;; - Second level headings are the words (with initial corresponding to the
;;   parent level). The content of the heading is the definition
;;
;; The code is inspired by the answer given in SO:
;; http://stackoverflow.com/a/13815213/671013
;;
;; List of TODOs:
;; - Alter the code from SO to fit the scheme described
;; - Handle the case when the file is empty
;; - Capitalize the first letter of the word

;;
;; remove extra spaces between stars and the headline text
;;
(defun tidy-headlines ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^\\*+\\([[:space:]][[:space:]]+\\)" (point-max) t)
      (replace-match " " nil nil nil 1))))

;;
;; function for storing things in vocab files like cashew /C/CA/Cashew
;;
(defun insert-vocab-word (vocab-word definition)
  "prompts for a word then opens a vocab file and puts the word in place"
  (interactive "sWord: \nsDefinition: ")
  (find-file "~/Dropbox/org/vocab.org")
  (tidy-headlines)

  ;; Find the first letter of vocab-word and store it (capitalized)
  ;; in first-letter
  ;; (let* ((first-letter (upcase (substring vocab-word 0 1))))
  ;;   (print first-letter))

  (goto-char (point-max))
  (newline)
  (org-insert-heading)
  (org-set-tags-command "drill")
  (insert vocab-word)
  (newline)
  (insert definition)
  (goto-char (point-min))
  (org-sort-entries nil ?a nil nil)
  (org-overview)
  )

;; ;;;;;;;;;;
;; ;; TRASH
;; ;;;;;;;;;;
;; (setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
;; 			 ("gnu" . "http://elpa.gnu.org/packages/")
;; 			 ("marmalade" . "http://marmalade-repo.org/packages/")))
;; (require 'package)
;; (package-initialize)

;; ;; Open a new window for the compilation process
;; ;; (setq special-display-buffer-names
;; ;;       `(("*compilation*" . ((name . "*compilation*")
;; ;;                             ,@default-frame-st
;; ;;                             (left . (- 1))
;; ;;                             (top . 0)))))

;; ;; org2blog
;; (require 'xml-rpc)
;; (setq load-path (cons "~/Library/elisp/org2blog/" load-path))
;; (require 'org2blog-autoloads)

;; (setq org2blog/wp-blog-alist
;;       '(("drorata"
;; 	 :url "http://drorata.wordpress.com/xmlrpc.php"
;; 	 :username "drorata")
;; 	("TeX.SE-Blog"
;; 	 :url "http://tex.blogoverflow.com/xmlrpc.php"
;; 	 :username "droratariah")
;; 	)
;;       )

;; ;; org to LaTeX beamer
;; ;; Add
;; ;;#+LaTeX_CLASS: beamer
;; ;; to the premable.
;; (require 'org-latex)
;; (unless (boundp 'org-export-latex-classes)
;;   (setq org-export-latex-classes nil))
;; (add-to-list 'org-export-latex-classes
;;              '("beamer"
;;                "\\documentclass[11pt]{beamer}\n\\usepackage[utf8]{inputenc}\n\\usepackage[T1]{fontenc}\n\\usepackage{hyperref}\n\\usepackage{verbatim}\n"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\begin{frame}\\frametitle{%s}" "\\end{frame}"
;;                 "\\begin{frame}\\frametitle{%s}" "\\end{frame}")))

;; Code browser
					;(add-to-list 'load-path
					;	     "~/Library/elisp/ecb-snap")
					;(setq stack-trace-on-error t)
					;(require 'ecb)

(require 'ibuffer)

;; ibuffer > list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Enable buffers grouping in the buffers list
(require 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("Org" ;; all org-related buffers
                (mode . org-mode))
               ("Programming" ;; prog stuff not already in MyProjectX
                (or
                 (mode . c-mode)
                 (mode . c++-mode)
                 (mode . perl-mode)
                 (mode . python-mode)
                 (mode . emacs-lisp-mode)))
               ("LaTeX"
                (mode . latex-mode))
               ("Directories"
                (mode . dired-mode))
               ))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

;; Enables ido when in an ibuffer buffer
(defun ibuffer-ido-find-file ()
  "Like `ido-find-file', but default to the directory of the buffer at point."
  (interactive
   (let ((default-directory (let ((buf (ibuffer-current-buffer)))
                              (if (buffer-live-p buf)
                                  (with-current-buffer buf
                                    default-directory)
                                default-directory))))
     (ido-find-file-in-dir default-directory))))
(define-key ibuffer-mode-map "\C-x\C-f" 'ibuffer-ido-find-file)
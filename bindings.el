;; Set behavior of END HOME keys
;; --- the following came from:
;; http://www.popcornfarmer.com/2008/04/mac-home-and-end-keys/
(if (boundp 'osx-key-mode-map)
    (setq hah-key-map osx-key-mode-map)
  (setq hah-key-map global-map))
(define-key hah-key-map [home] 'beginning-of-line)
(define-key hah-key-map [end] 'end-of-line)
(define-key hah-key-map [C-home] 'beginning-of-buffer)
(define-key hah-key-map [C-end] 'end-of-buffer)

;; Open files by pointing at them
(global-set-key (kbd "C-x f") 'find-file-at-point)

;; ibuffer > list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

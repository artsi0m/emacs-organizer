;; coping with codepages on MS windows
;; This part should be loaded before reading org files
;; to make it possible to read 1/3
(defvar *fs-encoding* 'utf-8)
(prefer-coding-system 'utf-8-unix)

;; 2/4 variables set by custom
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)


;; 3/4

;; layout
(load-file
 (expand-file-name "cyrillic-colemak.el" user-emacs-directory))

(setq default-input-method "cyrillic-colemak")


;; 4/4

(org-babel-load-file "README.org")

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


(setq use-package-compute-statistics 't)

(load-file
 (expand-file-name "backups.el" user-emacs-directory))

(load-file
 (expand-file-name "package-manager.el" user-emacs-directory))

(load-file
 (expand-file-name "language.el" user-emacs-directory))

(load-file
 (expand-file-name "appearance.el" user-emacs-directory))

(load-file
 (expand-file-name "autocomplete.el" user-emacs-directory))

(load-file
 (expand-file-name "file-manager.el" user-emacs-directory))

(load-file
 (expand-file-name "vcs.el" user-emacs-directory))

(load-file        ;; Also flashcards
 (expand-file-name "notebook.el" user-emacs-directory))

(load-file
 (expand-file-name "pomodoro.el" user-emacs-directory))

(load-file
 (expand-file-name "tex.el" user-emacs-directory))

(load-file
 (expand-file-name "shell.el" user-emacs-directory))

(load-file
 (expand-file-name "python.el" user-emacs-directory))

(load-file
 (expand-file-name "common-lisp.el" user-emacs-directory))

(load-file
 (expand-file-name "compiler-explorer.el" user-emacs-directory))

(load-file
 (expand-file-name "yaml.el" user-emacs-directory))

(use-package rfc-mode)
(use-package helm-info)

(use-package nov)

(let ((fname "~/howm/gnus.el"))
        (when (file-exists-p fname)
  	(load fname)))



;; coping with codepages on MS windows
;; This part should be loaded before reading org files
;; to make it possible to read 1/3
(defvar *fs-encoding* 'utf-8)
(prefer-coding-system 'utf-8-unix)

;; 2/4 variables set by custom
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka Term Extended" :foundry "outline" :slant normal :weight regular :height 120 :width normal))))
 '(adoc-title-0-face ((t (:inherit adoc-title-face :height 1.5))))
 '(adoc-title-1-face ((t (:inherit adoc-title-face :height 1.4))))
 '(adoc-title-2-face ((t (:inherit adoc-title-face :height 1.3))))
 '(adoc-title-3-face ((t (:inherit adoc-title-face :height 1.2))))
 '(adoc-title-4-face ((t (:inherit adoc-title-face :height 1.1))))
 '(adoc-title-5-face ((t (:inherit adoc-title-face :height 1.0)))))


;; 3/4

;; layout
(load-file
 (expand-file-name "cyrillic-colemak.el" user-emacs-directory))

(setq default-input-method "cyrillic-colemak")

;; 4/4 config file in org mode and gnus
(org-babel-load-file
 (expand-file-name "config.org" user-emacs-directory))

(let ((fname "~/howm/gnus.el"))
        (when (file-exists-p fname)
  	(load fname)))

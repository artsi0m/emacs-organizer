;; artsi0m's emacs config

(use-package emacs
  :init

  ;; For dealing with org-pomodoro
  (when (eq system-type 'windows-nt)
    (setq system-time-locale "C"))

  ;; ls from GNU coreutils on OpenBSD
  (when (eq system-type 'berkeley-unix)
  (setq insert-directory-program "gls")) 

  ;; for org export i need some way to save files in unicode 

  (defvar *fs-encoding* 'utf-8)

  ;; I use colemak keyboard layout
  (load-file "~/.emacs.d/cyrillic-colemak.el")
  (setq default-input-method "cyrillic-colemak"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(unless (require 'vc-use-package nil t)
  (package-vc-install "https://github.com/slotThe/vc-use-package"))

;; (package-initialize)
(let ((default-directory (expand-file-name "elpa/" user-emacs-directory)))
  (normal-top-level-add-subdirs-to-load-path))

;; use-package
(setq use-package-enable-imenu-support t)
(setq use-package-always-ensure t)
(unless (require 'bind-key nil t)
  (package-install 'bind-key))


(use-package org-timeblock
  :vc (:fetcher github :repo ichernyshovvv/org-timeblock))

(use-package org
  :mode ("\\(\\.txt\\|\\.org\\|\\.howm\\)$" . org-mode)
  :custom
  (org-startup-folded nil)
  (if (and (string-match -p "kanamori" (system-name)) (eq system-type 'gnu/linux))
      (org-directory "/mnt/c/Users/rakka/org")
    (org-directory "~/org"))
  (org-agenda-files `(,org-directory))
  (org-format-latex-options
   '(:foreground default :background default :scale 1.7 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
  (org-todo-keywords
   '((sequence "TODO(1)" "|" "DONE(2)" "FAIL(3)" ))))

(use-package elfeed
  :ensure t
  :config
  ;; (setq elfeed-db-directory (expand-file-name "elfeed" user-emacs-directory)
  ;;       elfeed-show-entry-switch 'display-buffer)
  ;;  (setq elfeed-db-directory "~/.elfeed")
  (if (and (string-match-p "kanamori" (system-name)) (eq system-type 'gnu/linux))
      (setq elfeed-db-directory "/mnt/c/Users/rakka/.elfeed")
    (setq elfeed-db-directory "~/.elfeed"))

(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (if (and (string-match-p "kanamori" (system-name)) (eq system-type 'gnu/linux))
      (setq rmh-elfeed-org-files (list "/mnt/c/Users/rakka/org/elfeed/youtube.org"
				       "/mnt/c/Users/rakka/org/elfeed/blogs.org"
				       "/mnt/c/Users/rakka/org/elfeed/twitter.org"))
    
    (setq rmh-elfeed-org-files (list "~/org/elfeed/youtube.org"
				 "~/org/elfeed/blogs.org"
				 "~/org/elfeed/twitter.org"))))

(use-package howm
  :init 
  (setq howm-view-title-header "*")
 
  :if (string-match-p "kanamori" (system-name))

  :custom
  (if (and (string-match -p "kanamori" (system-name)) (eq system-type 'gnu/linux))
      (progn (howm-home-directory "/mnt/c/Users/rakka/Documents/howm/")
	     (howm-directory "/mnt/c/Users/rakka/Documents/howm/"))
    (progn (howm-home-directory "~/Documents/howm/")
	   (howm-directory "~/Documents/howm/")))
  :init 
  (setq howm-view-title-header "*")
  :commands(howm-menu))

(use-package eglot
  :config (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster)
  
  (defun my/eglot-capf ()
    (setq-local completion-at-point-functions
		(list (cape-super-capf
                     #'eglot-completion-at-point
		     ;; #'tempel-expand ;; I don't use tempel yet
                     #'cape-file))))

  (add-hook 'eglot-managed-mode-hook #'my/eglot-capf)
  :hook ((c-mode c++-mode) . eglot-ensure))

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-preselect 'prompt)
  :bind
  ([C-tab] . completion-at-point)
  (:map corfu-map
	("TAB" . corfu-next)
	([tab] . corfu-next)
	("S-TAB" . corfu-previous)
	([backtab] . corfu-previous))
  :init
  (if (display-graphic-p) (global-corfu-mode) (corfu-terminal-mode)))

(use-package minsk-theme
  :config
  (when window-system (load-theme 'minsk t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7e300d88af7750886190c744f63d2d66580bb2cbb8e371a3cb5109afe3017a5a" default))
 '(org-pomodoro-audio-player 'sound-wav)
 '(package-selected-packages
   '(elfeed-org elfeed org-roam-ql cape corfu corfu-terminal eglot org org-ql esup transpose-frame fb2-reader calfw-ical calfw-org calfw howm sound-wav org-pomodoro org-drill minsk-theme))
 '(package-vc-selected-packages
   '((org-timeblock :vc-backend Git :url "https://github.com/ichernyshovvv/org-timeblock")
     (vc-use-package :vc-backend Git :url "https://github.com/slotThe/vc-use-package"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka" :foundry "outline" :slant normal :weight regular :height 120 :width normal)))))

;; Load calendar initialization
;; (load "~/.emacs.d/init-calendar.el")
;; decided to use org-timeblock instead
(when (string= (system-name) "Azusa")
  (setq source-directory (expand-file-name "ports/pobj/emacs-29.1-gtk3/emacs-29.1" (getenv "HOME"))))

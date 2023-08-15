;; artsi0m's emacs config

(when (eq system-type 'windows-nt)
    (setq system-time-locale "C")) ;; For dealing with org-pomodoro

(defvar *fs-encoding* 'utf-8) ;; for org export i need some way to save files in unicode

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/" ) t)

;; (package-initialize)
(let ((default-directory (expand-file-name "elpa/" user-emacs-directory)))
  (normal-top-level-add-subdirs-to-load-path))

;; org-time-blocking
(add-to-list 'load-path "~/Sources/org-timeblock")
(use-package org-timeblock) 

;; use-package
(setq use-package-enable-imenu-support t)
(eval-when-compile
  (unless (require 'use-package nil t)
    (package-install 'use-package)))
(unless (require 'bind-key nil t)
  (package-install 'bind-key))

(use-package org
  :mode ("\\(\\.txt\\|\\.org\\|\\.howm\\)$" . org-mode)
  :custom
  (org-startup-folded nil)
  
  (when (string=  (system-name) "KANAMORI")
    (org-agenda-files (list "~/Documents/daily.org"
			  "~/Documents/weekly.org"
			  "~/Documents/July_2023.org"
			  "~/Doucments/August_2023.org"
			  "~/Documents/2023.org"
			  "~/Documents/morning.org")))
  
  (org-format-latex-options
   '(:foreground default :background default :scale 1.7 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
  (org-todo-keywords
   '((sequence "TODO(1)" "|" "DONE(2)" "FAIL(3)" ))))

(use-package org-habit
  :after org)

(use-package howm
  :if (string= (system-name) "KANAMORI")
  :custom
  (howm-home-directory "~/Documents/howm/")
  (howm-directory "~/Documents/howm/")
  :init 
  (setq howm-view-title-header "*")
  :commands(howm-menu))

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
 '(org-agenda-files
   '("c:/Users/rakka/Documents/daily.org" "c:/Users/rakka/Documents/weekly.org" "c:/Users/rakka/Documents/July_2023.org" "c:/Users/rakka/Documents/2023.org") nil nil "Customized with use-package org")
 '(org-pomodoro-audio-player 'sound-wav)
 '(package-selected-packages
   '(org org-ql esup transpose-frame fb2-reader howm calfw-ical calfw-org calfw sound-wav org-pomodoro org-drill minsk-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 '(default ((t (:family "Iosevka" :foundry "outline" :slant normal :weight regular :height 120 :width normal)))))

;; Load calendar initialization
;; (load "~/.emacs.d/init-calendar.el")
;; decided to use org-timeblock instead

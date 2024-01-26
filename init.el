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
  (prefer-coding-system 'utf-8-unix)

  ;; Load my own variab
  (load "~/.emacs.d/artsi0m-const.el")
  
  ;; Load my own subroutines
  (load "~/.emacs.d/artsi0m-defuns.el")
  
  ;; Load my advices
  (load "~/.emacs.d/artsi0m-advices.el")

  ;; I use colemak keyboard layout
  (load-file "~/.emacs.d/cyrillic-colemak.el")
  
  (setq default-input-method "cyrillic-colemak"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; use-package
(setq use-package-enable-imenu-support t)
(setq use-package-always-ensure t)
(unless (require 'bind-key nil t)
  (package-install 'bind-key))

(use-package howm
  :init (setq howm-view-title-header "*")
  (setq howm-file-name-format "%Y/%m/%Y-%m-%d-%H%M%S.org"))

(use-package org
  :mode ("\\(\\.txt\\|\\.org\\|\\.howm\\)$" . org-mode)
  :custom
  (org-format-latex-options
   '(:foreground default :background default :scale 2 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
  (org-todo-keywords
   '((sequence "TODO(1)" "|" "DONE(2)" "FAIL(3)" "NGMI(4)" )))
  :after howm)


(use-package org-drill
  :after howm)

(use-package hydra)

(use-package org-fc
  :load-path "~/.emacs.d/src/org-fc"
  :custom
  (org-fc-review-history-file "~/howm/.org-fc-reviews.tsv")
  (org-fc-directories (my-howm-subsubdirs))
  :config
  (require 'org-fc-hydra))

(use-package org-timeblock)


(use-package elfeed
  :ensure t
  :config
  (setq elfeed-db-directory "~/howm/.elfeed")
    (setq elfeed-curl-program-name "curl"))

(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  :after howm)

(use-package eglot
  :config (add-to-list 'eglot-server-programs
		       '((c++-mode c-mode) "clangd")))

(use-package pyvenv)

(use-package vertico
  :init (vertico-mode)
(setq completion-in-region-function
      (lambda (&rest args)
        (apply (if vertico-mode
                   #'consult-completion-in-region
                 #'completion--in-region)
               args))))

;; (use-package minsk-theme
;;   :config
;;   (when window-system (load-theme 'minsk t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-operandi))
 '(custom-safe-themes
   '("fc608d4c9f476ad1da7f07f7d19cc392ec0fb61f77f7236f2b6b42ae95801a62" "a197d6d98f7a01991275578aa0a1311363d4662f0ecfa8e15779ce63e0f76baa" "7e300d88af7750886190c744f63d2d66580bb2cbb8e371a3cb5109afe3017a5a" default))
 '(default-input-method "cyrillic-colemak")
 '(gnus-backup-startup-file 'never)
 '(gnus-save-score t)
 '(gnus-select-method
   '(nnimap "imap.gmail.com"
	    (nnmail-expiry-target "nnimap+gmail:[Gmail]/Корзина")
	    (nnimap-stream ssl)
	    (gnus-search-engine gnus-search-imap)
	    (nnmail-expiry-wait 5)))
 '(gnus-startup-file "~/howm/.newsrc")
 '(message-send-mail-function 'smtpmail-send-it)
 '(message-sendmail-envelope-from nil)
 '(org-babel-C-compiler "clang")
 '(org-babel-load-languages
   '((emacs-lisp . t)
     (gnuplot . t)
     (awk . t)
     (C . t)
     (dot . t)
     (python . t)))
 '(org-pomodoro-audio-player 'sound-wav)
 '(package-selected-packages
   '(transmission slime eat clang-format+ magit hydra pyvenv org-timeblock racket-mode consult-eglot consult elfeed-protocol modus-operandi calfw org-drill-table powershell auctex vc-use-package elfeed-org elfeed org-roam-ql vertico eglot org org-ql esup transpose-frame fb2-reader howm sound-wav org-pomodoro org-drill minsk-theme))
 '(smtpmail-default-smtp-server "smtp.gmail.com")
 '(smtpmail-servers-requiring-authorization "*")
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(smtpmail-stream-type nil)
 '(speedbar-default-position 'left)
 '(tab-bar-mode t)
 '(user-full-name "Корякин Артём")
 '(user-mail-address "karakin2000@gmail.com"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka Term Extended" :foundry "outline" :slant normal :weight regular :height 120 :width normal)))))

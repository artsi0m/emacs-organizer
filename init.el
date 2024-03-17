;; coping with codepages
(defvar *fs-encoding* 'utf-8)
(prefer-coding-system 'utf-8-unix)

;; artsi0m's emacs config
(org-babel-load-file "~/.emacs.d/layout.org")
(org-babel-load-file "~/.emacs.d/config.org")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; use-package -- added by Illya
(setq use-package-enable-imenu-support t)
(setq use-package-always-ensure t)
(unless (require 'bind-key nil t)
  (package-install 'bind-key))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-operandi))
 '(custom-safe-themes
   '("b40f11c174e7e475508f1e2c1cfca354d37212494c143a494f27239c7d71a294" "2cc1b50120c0d608cc5064eb187bcc22c50390eb091fddfa920bf2639112adb6" "fc608d4c9f476ad1da7f07f7d19cc392ec0fb61f77f7236f2b6b42ae95801a62" "a197d6d98f7a01991275578aa0a1311363d4662f0ecfa8e15779ce63e0f76baa" "7e300d88af7750886190c744f63d2d66580bb2cbb8e371a3cb5109afe3017a5a" default))
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
 '(org-babel-C++-compiler "clang++")
 '(org-babel-C-compiler "clang")
 '(org-babel-load-languages
   '((emacs-lisp . t)
     (gnuplot . t)
     (awk . t)
     (C . t)
     (dot . t)
     (python . t)))
 '(org-drill-cram-hours 72)
 '(org-drill-scope 'directory)
 '(org-pomodoro-audio-player 'sound-wav)
 '(package-selected-packages
   '(org-pomodoro dired calfw-howm calfw-org calfw-ical matlab-mode transmission slime eat clang-format+ magit hydra pyvenv racket-mode consult-eglot consult elfeed-protocol modus-operandi calfw org-drill-table powershell auctex elfeed-org elfeed org-roam-ql vertico eglot org org-ql esup transpose-frame fb2-reader howm sound-wav org-drill minsk-theme))
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

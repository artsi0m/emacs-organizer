(setopt icon-map-list nil) ;; build in icons

(tab-bar-mode) ;; tab bar mode by default

(which-key-mode) ;; key suggestions

(global-visual-line-mode)

(use-package modus-themes
  :init (load-theme 'modus-operandi)
  :when (not (eq window-system nil)))


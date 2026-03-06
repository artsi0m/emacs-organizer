;; Press C-M-i to activate emacs autocomplete.

;; Frankly speaking, I copy this snippet from the official vertico docs:

;; https://github.com/minad/vertico?tab=readme-ov-file#completion-at-point-and-completion-in-region

;; This configuration give my ability to perform fuzzy search.
;; Like with dmenu, rofi or fzf, but in emacs.

(use-package vertico
  :init (vertico-mode)
     (setq completion-in-region-function
	   (lambda (&rest args)
	     (apply (if vertico-mode
			   #'consult-completion-in-region
		      #'completion--in-region)
		    args)))
     :ensure t)

(use-package consult :ensure t)

(use-package consult-eglot :commands (eglot) :ensure t)

(use-package howm
  :init (when (not (eq system-type 'windows-nt))
          (setq howm-view-use-grep t))
  :custom
  (howm-search-other-dir t)
  :ensure t)


(use-package howm-use-any-markup
  :vc (:url "https://github.com/artsi0m/howm-use-any-markup")
  :ensure t)


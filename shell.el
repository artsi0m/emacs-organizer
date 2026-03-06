(use-package flymake-shell
  :hook (sh-mode . flymake-shell-load)
  :when (executable-find "sh")
  :ensure t)

(use-package flymake-shellcheck
  :when (executable-find "shellcheck")
  :hook (sh-mode . flymake-shellcheck-load) :ensure t)
